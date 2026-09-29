---
layout: post
title: "Stop Reading the File to Answer a Yes or No"
date: 2026-09-29
description: "A pre-tool hook, a compact check, and a question about a file the agent has not opened: where a cheap System One call sits inside the loop."
---

[Yesterday's post]({% post_url 2026-09-28-jev-a-fast-cheap-system-one-for-your-agents-system-two %})
left a placement question. If a calibrated yes or no is cheap enough to run
on everything, which decisions were we skipping because checking used to cost
too much? [IndyDevDan's ten levels of Jev](https://www.youtube.com/watch?v=_U-O5lYhJ7Q&t=948s)
starts answering it inside a coding-agent harness, at the moment a shell
command is about to run.

The session is a Pi agent. He tells it to clean the repo: delete
`node_modules`, remove the sessions directory, run the tests. A pre-tool hook
sends the command to Jev and asks whether it is irreversible and whether the
intent is destructive. The delete comes back irreversible, and the shell never
sees it. He starts a fresh session and asks for a force-push of the current
branch to `origin main`. Same hook, same block. The agent reports that the
force-push could not be completed. A write aimed at a file holding a secret
gets the same treatment on the write tool.

## A catalog of bad commands does not scale with the model

An allowlist fails on the command nobody wrote down. Dan's example from the
same video is `find -delete`, one of many ways to remove a tree that will not
appear in a list of `rm` variants. The hook asks a judgment about the string,
with a few examples in the question so Jev can treat an unseen flag
combination as the same decision. The harness still owns the block. The split
from yesterday holds: the generative model proposes, Jev returns a signal,
application code decides whether that signal may execute.

A stronger proposer makes the hook more necessary, because it is better at
commands you did not anticipate. The demo model is Gemini 3.8 Flash. In the
same video, `ls` on the source tree comes back read only, and he treats that
command as safe to run. Confidence is what separates the listing from the
force-push. The threshold lives in the harness, sized to what a wrong allow
costs. For a push to the default branch, that cost is history you cannot
restore.

## A token counter compacts at the wrong moment

Dan drops Jev into the self-compacting Pi harness from the week before. The
agent hears nothing until a mark. He set the marks low so the behavior would
show on camera: a notice at 6,000 tokens, a recommendation at 10,000, a
request at 14,000. On the turn where he switches tasks, the state sent to Jev
includes the new request, the previous work, and the recent shell turns. Two
questions: is this request a different task, and are we at the boundary.
Compact fires at turn end when both come back yes.

A counter compacts because the window is full. It will also compact in the
middle of a change, and it will keep a finished task's trace when the window
still has room. Code can keep owning the numbers. I would not ship those
marks. Jev answers the question the counter cannot, which is whether the
work in this state is the same work. Long sessions outside the loop, one
agent or a small team, need that question on every turn end. A generative
call in that spot is why compaction stays a command you type yourself.

## Ask before the file enters the window

The harness tool takes a path and a yes or no, reads the file in code, and
sends the text to Jev. The instruction to the agent is explicit: do not read
these files. Ask whether this one validates tokens, and whether that one
contains real credentials. His token count for that turn sat around 2,000,
because the files never entered the agent's context. A second tool asks a
choice: HTTP handler, domain logic, or data access, and returns a confidence
on the pick.

Then one tool invocation covers several paths, with two questions in a single
Jev request: does this touch auth, and which layer is it. Three answers come
back in under half a second. The generative model still has not read the
files. A glob over the TypeScript in the repo asks whether each file contains
a known bug, a TODO, or a commit message that admits a shortcut. That
pass covers ten files in parallel. The agent reports which paths came back
yes, and at what probability. One of them is `users.ts`. The pass still costs a fraction of a
penny. A failing test caused by rounding gets the recursive form: one
question, whether the file is relevant to that bug, over the whole repo. Jev
returns two files at high confidence, which is the shortlist a stronger model
then reads.

Yesterday's price comparison missed the larger bill. Judging a file meant
parking it in a generative window so a model could look. A lot of those looks
are scouting, asking whether a file is relevant, which layer it sits in,
and whether it already admits the bug. You can ask that across the tree,
then open the files that came back relevant. The generative model spends its
window on the file it is about to change.

Dan says that in his own tests Jev matched what his agents returned on simple
classification questions, in less time and at lower cost. He also says to validate it against the workload you ship. I would hold
him to that. A scout that misses the relevant file is worse than an expensive
read, because the edit proceeds on a shortlist that was wrong. The confidence
on the relevance question decides how many files you open after the scout,
and that threshold belongs in the harness with the others.

## Let the agent write the question

Up to here, a person designed every question. Dan then tells the agent the
tests are red, to classify the failure before touching code, to fix it, to
run the tests again, and to use Jev wherever a bounded question would do. The
test command goes through the same guard and is allowed because it is
read only. Jev classifies the output as a bug, at high confidence. The agent
asks whether the fix is a simple rounding change, what the risk of the edit
is, and, after the patch, whether the tests look clean. It can point Jev back
at the file and ask whether bugs remain.

That holds up only when the tool description is as specific as the JSON we
were writing by hand. "Check this" returns a probability you cannot
threshold. The prompt work moved out of a request body and into the
description the agent reads before it calls.

Jev answers a question about state someone assembled. It does not write the
patch, and Dan is explicit that it should not operate a UI or hold a
long-running loop. Once the agent is the one assembling the state, the schema
of allowed questions is the control. The [harness in the video](https://github.com/disler/ten-levels-of-jev)
is one concrete schema. Copying the tool names without copying the question
boundaries will not reproduce the result.
