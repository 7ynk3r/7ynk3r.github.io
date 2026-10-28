---
layout: post
title: "Pair Programming With a Brilliant Junior"
date: 2026-10-26
description: "Treat a model like a sharp new hire, not a vending machine. The bad first draft is your onboarding doc, and your frustration is the requirement you forgot to write down."
---

Picture a new hire on their first Monday. Sharp, fast, read the whole codebase over the weekend, eager to ship something by lunch. You hand them a ticket that says "clean up the export flow." By two o'clock they've renamed half the module, rewritten the retry logic in a style nobody on the team uses, and opened a pull request with a beautifully written description of changes you never wanted.

You don't fire them. You pull up a chair.

I've sat on both sides of that chair. Early in my career I was the junior who rewrote something nobody asked me to touch, because the ticket left room for it. Later I was the one who wrote the vague ticket and then felt irritated by the result. Both times the problem was sitting in the ticket. The junior wasn't careless. They filled the silence with their best guess, and their best guess was smart and wrong.

## First week

That's the most accurate picture I have of working with a model: a brilliant junior who has read everything and knows nothing about what you specifically want. When people tell me AI doesn't work for them, they usually describe one exchange. They asked, it answered badly, they closed the tab. That's a vending machine. Coin in, snack out, and if the wrong snack drops you shake the machine and leave.

Nobody onboards a person that way. With a new engineer you expect the first attempt to be off. You read it, notice what bothers you, and say it out loud: "we don't touch the retry logic in this change," "keep the public function names," "done means the existing tests pass and nothing else moved." Each of those sentences exists because the first attempt crossed a line you hadn't drawn yet. The bad pull request wrote half the onboarding doc.

The people I see getting the most out of these tools do the same thing with a model. They iterate, and they count the iteration as the work itself. That's the skill, and most of it happens in your own head.

<figure>
  <img src="{{ '/assets/diagrams/variant-b/conversation-loop.svg' | relative_url }}" alt="A loop of four steps: prompt, bad output, frustration, refined spec, and back to prompt. Frustration is highlighted as the signal. A box in the middle reads better output, each lap.">
  <figcaption>One lap of the conversation. The highlighted step is where most people quit, and where the next requirement comes from.</figcaption>
</figure>

## What the frown is for

The part I had to learn was what to do with frustration. My first reaction to a bad output is the same as to a bad pull request, a small flash of "why would you do that?" For a long time I either swallowed it and retried, or let it harden into a verdict on the tool.

Now I treat the frown as a pointer. If I'm annoyed, I'm holding a requirement I never wrote down, so I stop and name it. I once asked for a migration plan and got a confident, tidy document that assumed we could take the service down for an hour. I was irritated for about ten seconds, and then I saw that the irritation was the spec I had skipped: zero downtime, a rollback at every step, a named person who signs off before the cutover. The model hadn't failed me. It had shown me, very quickly, what I hadn't thought through. I wasn't debugging the model. I was debugging my own thinking, with a partner who never gets tired of the next draft.

## Write it on the whiteboard

When I pair with a person, the most useful object in the room is usually the whiteboard. We both write on it. It holds the goal, the constraints, a couple of examples, and, if we're disciplined, a line that says how we'll know we're done. When the junior asks a question, the answer goes on the board, so we don't have the same conversation tomorrow.

<figure>
  <img src="{{ '/assets/diagrams/variant-b/whiteboard.svg' | relative_url }}" alt="A shared whiteboard with four sections: goal, constraints, examples, and done when, with done when highlighted. On the left, me writes to the board and answers questions. On the right, the junior or model reads the board and asks questions back.">
  <figcaption>The spec as a shared whiteboard. The done when box is the one I skip most often.</figcaption>
</figure>

A spec for a model works the same way if you let it. I write the intent. The model reads it and, when I've set things up so it can, asks back where it's unsure. The answers go on the board. The "done when" box is the one I skip most and regret most, because it's the only part that turns "I'll know it when I see it" into something you can check.

## The car around the engine

The analogy needs one more piece, because a good junior also gets a good environment: access to the right repos and not the wrong ones, a build that fails loudly, a reviewer, notes from last week.

For a model, that environment is the harness. It covers what goes into the context window, which tools the model can route to, what it remembers, and the eval loops that tell you whether today's run is as good as yesterday's. The model is the engine. The harness is the steering wheel, the brakes, and the dashboard. Steering is what makes the harness worth building, because that's where my judgment gets written down so I don't have to supply it again on every run.

<figure>
  <img src="{{ '/assets/diagrams/variant-b/model-vs-harness.svg' | relative_url }}" alt="A layer stack. At the bottom, the engine: the model, raw and swappable. Above it, the steering wheel: context, tools, and memory, highlighted. Then the brakes: rules and checks. At the top, the dashboard: eval loops.">
  <figcaption>The model supplies power. Everything above it is the harness, and the steering layer is where my judgment lives.</figcaption>
</figure>

There's a quieter benefit I didn't expect. Once the environment is good, the junior doesn't have to be a genius. A cheaper, faster model that follows rules reliably, inside a harness that holds the context and checks the output, often does repetitive work better than the smartest model running with no guidance. A factory makes the same trade when it uses a jig instead of a master craftsman. The fixture holds the precision, so the hands don't have to.

## Steering doesn't go away

People keep telling me this scaffolding is temporary, and that models will soon be smart enough to need none of it. I usually ask whether their best senior engineer still gets code review. They do, of course. Review is where the team's standards live, and those standards outlast any one person on the team.

I think about the harness the same way. Smarter models will need fewer corrections per lap, and I'll be glad of it. They'll still need someone to say where we're going, and the boring weekly operations will still need something that keeps the four hundredth run as good as the first.

So pull up a chair, because the first draft will be wrong, and the way it's wrong is the most specific feedback you'll ever get about what you meant.
