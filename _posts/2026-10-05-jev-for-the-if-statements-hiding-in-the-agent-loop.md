---
layout: post
title: "Jev for the If Statements Hiding in the Agent Loop"
date: 2026-10-05
description: "Routing, a bash gate, which skill to load, and which passages to keep: the Jev calls that answer those decisions before the generative model spends the window."
---

[The last post]({% post_url 2026-09-28-jev-a-fast-cheap-system-one-for-your-agents-system-two %})
left a placement question. If a calibrated yes or no is cheap enough to run
on everything, which decisions were we skipping because checking used to cost
too much? They were already in the loop. Most of the model calls in a harness
are decisions: which tool, which skill, whether a command is safe to run,
which of a pile of retrieved passages actually answers the question.

We have been paying a generative call for each of those, so the checks that
should be there get left out. A verification step on every tool result makes
the loop too slow when the step is another paragraph. Jev is the if statement
those calls were standing in for. TypeSafe's rule is the one I want on the
harness: if a panel of smart people could answer in a few seconds, ask a
typed question. If they would have to go away and write the answer, keep the
generative model.

## Four hooks, one shape of code

The loop is the same in a framework or in a script you wrote. A request
arrives with a tool registry, a prompt, and some skills. The model emits a
tool name and arguments. The harness runs it, appends the result, and goes
around again until the model says it is done. There are four places to
interrupt that, and the interruption has one shape. Before the prompt is
built, decide which skills to load. Before the model call, decide which
model to call. Before a tool runs, decide whether it is safe. After a result
comes back, decide whether it is good enough or the loop should go again.

Each of those is the same few lines. Build a state from what the loop already
holds, ask the typed questions, read the probabilities, and branch. The
threshold stays in the harness, sized to what a wrong allow costs. Pin the
model id once a threshold depends on it. `jev-latest` moves when a new
release ships.

The tool hook is the one I would ship first. On bash, the state is the
command string and the questions are the branch. An allowlist misses the
delete nobody wrote down. `find -delete` removes a tree and will not appear
on a list of `rm` variants. A force-push of the default branch should not
run, because that history does not come back. `ls` on a source tree is read
only and should. One call asks both:

```json
{
  "model": "jev-1.13.0",
  "state": "git push --force origin main",
  "questions": {
    "destructive": {
      "type": "noul",
      "instructions": "Is this command destructive?"
    },
    "reversible": {
      "type": "noul",
      "instructions": "Can this be undone without a backup?"
    }
  }
}
```

`noul` comes back as a probability between 0 and 1, under the key you sent.
The harness blocks when `destructive` clears its line and `reversible` does
not. A write into a file that holds a secret is the same request on the
write tool, with the path and the contents as state. The generative model
can propose a stranger command next month. The hook does not need to have
seen the string before.

Letting Jev pick the tool, and calling the generative model only when the
probability is low or something must be written, cuts more calls. I would
not start there. It gets worse once the task needs several steps joined
into an answer.

## Load the skill after the category is known

A skill file stays out of the window until something decides it is needed.
With fifty of them, that decision is a call of its own, and making it with
the model about to do the work puts every description back in the prompt.

Split it into two choices against a short state, the task text. Ten
categories with five skills in each is a catalog you can ask about without
pasting the bodies. The prompt carries the category names. The first call
picks the category. Three of them:

```json
{
  "model": "jev-1.13.0",
  "state": "An email pretending to be our CEO asks for gift cards.",
  "questions": {
    "category": {
      "type": "choice",
      "instructions": "Which skill category fits this task?",
      "criteria": {
        "security": "phishing, access, or a suspicious login",
        "research": "look something up or check a claim",
        "audio": "voiceover, speech, or other audio"
      }
    }
  }
}
```

The answer is the winning key, a probability per option, and a confidence.
A second call uses the same shape, with `state` still the task and
`criteria` limited to the skills inside the chosen category. I would expect
the gift-card email to resolve to `security`, then to the skill that triages
a phishing report. A request for a short voiceover of a product description
should resolve to `audio`, then to text to speech. If it does not, the
criteria are wrong, and the fix is a benchmark of those criteria. The
generative model receives the one skill that was chosen and works out the
arguments. It does not see the other forty-nine.

## Score the passages, then spend the window

When the reranker is another call you do not want to wait on, score the
passages in one call. A lexical sweep of about twenty-five is enough. The
state is the question, and each passage is its own `score` question. Two
of them:

```json
{
  "model": "jev-1.13.0",
  "state": "Why are my webhook requests failing?",
  "questions": {
    "signatures": {
      "type": "score",
      "instructions": "How relevant is a passage on verifying webhook signatures?",
      "criteria": [
        "unrelated",
        "mentions the area and does not answer",
        "answers part of the question",
        "send this passage to the generative model"
      ]
    },
    "http_overview": {
      "type": "score",
      "instructions": "How relevant is a generic HTTP status-code page?",
      "criteria": [
        "unrelated",
        "mentions the area and does not answer",
        "answers part of the question",
        "send this passage to the generative model"
      ]
    }
  }
}
```

`score` comes back as a number on that scale, plus the distribution. I would
want signature verification, raw bodies, proxies, and signing secrets to
outrank the generic HTTP page. A yes or no on each passage throws away the
ordering. A single choice throws away the other passages that were also
relevant.

The same gate belongs on an API result: accept it, retry it, or drop it
before appending it to the conversation. Parking the whole payload in a
generative window was the cost the last post's price comparison left out.

A scout that drops the relevant passage is worse than an expensive read,
because the answer then proceeds on a shortlist that was wrong. How many you
open afterward is the confidence on the score, and that number sits with the
other thresholds in the harness.

## Write the criteria yourself

These questions hold up when the instructions are as specific as a branch
you would have written by hand. A compound question, two decisions stuffed
into one instruction, is where Jev slips. Split it, the way the bash hook
asks `destructive` and `reversible` as separate keys. Ask whether the state
is trying to override the question before you ask the question you care
about. Jev can be pushed off its criteria the same way a generative model
can. "Check this," especially when the generative model composed that
sentence on the fly, is not a rubric. I want the criteria in the repo, and
I want a change to them benchmarked the way a change to a threshold is.

Writing the answer stays with the generative model, and so does any
reasoning that has to connect several retrieved facts into something none
of them said alone. Jev does not take images. Some open decision models do,
which is why I would use one of those when the state is a screenshot.
TypeSafe's docs say accuracy drops on long inputs, and I would not send a
state on the order of a hundred thousand tokens. If the agent runs where
the state cannot leave the machine, a hosted call is the wrong place for a
command string or a customer ticket. An open decision model can sit in the
same four hooks and stay local.
