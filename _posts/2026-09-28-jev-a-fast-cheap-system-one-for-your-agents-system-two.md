---
layout: post
title: "Jev: A Fast, Cheap System One for Your Agent's System Two"
description: "TypeSafe named its model after Kahneman's fast thinking and Jevons's cheap coal. Both bets say something about where agent decisions are headed."
date: 2026-09-28
---

Daniel Kahneman split thinking into two systems: System 1, fast and intuitive,
and System 2, slow and deliberate. Every LLM we call from an agent is doing
System 2 work, generating a paragraph token by token, even when the actual
question is a yes or no. TypeSafe AI built a model for the other half. They call
Jev a "System One model," and the name is the argument: most of what software
needs from AI isn't reasoning, it's a fast, calibrated judgment call.

## What it takes in, what it returns

Jev accepts a state (text or structured data describing whatever's being
decided) and a map of typed questions, answered together in one parallel pass.
Three primitives cover every question: `Choice` among up to 255 labeled options,
`Score` on an ordered scale, `Noul` for a calibrated yes/no returned as a
probability. Nothing is generated. The answer type is fixed before the call, so
the model can only return one of the options you defined, a score on your scale,
or a probability. TypeSafe trains it for calibration rather than fluency: when
Jev says 80%, it's aiming to be right about 80% of the time.

## Who does what in the loop

An agent system built with Jev splits cleanly into roles. The orchestrator
maintains the loop, the context, and the plan. The generative model does the
open-ended work: writing, reasoning, deciding what to try next. Jev answers
narrow, bounded questions about the current state, fast enough to sit inline.
Application code still owns permissions and execution, and a human still reviews
the cases that come back uncertain. Jev's job in that chain is narrow on
purpose: it returns a signal, and every other component keeps its existing
responsibility.

## What a decision costs

Speed and price are the same story told twice. TypeSafe lists Jev at 70 to 500
milliseconds per call and $0.042 per million input tokens, with output free. A
frontier LLM runs anywhere from seconds to minutes depending on output length,
and $0.20 to $10 per million input tokens, with output priced roughly 5x higher
on top of whatever tokens it spent writing the sentence you now have to parse.
TypeSafe's own benchmarks put the gap at up to roughly 190x faster and 440x
cheaper, self-reported against its own test suite rather than a public
leaderboard. An independent test outside that suite found a smaller gap on a
harder task, about 25x faster and 580x cheaper, with a modest accuracy
trade-off. Read the self-reported number as a ceiling and the independent one as
a floor, and the honest range is still wide enough to change what you can afford
to check.

## Two shapes of use

Some decisions have to happen inside a live interaction, where the constraint is
latency: a decision that doesn't land inside the turn might as well not exist.
Others are decisions you want to run on everything rather than a sample, where
the constraint is cost.

Latency is what pushes a check into the interaction itself. A checkout fraud
score, computed inline as a `Score` question over the transaction state,
replaces a fixed dollar threshold without adding a pause the shopper can feel. A
voice agent deciding whether to interrupt, or a chat widget deciding when to
hand off to a person, needs its answer inside the turn: a tenth of a second
fits, a multi-second LLM call doesn't, and the delay is what the user notices.

Cost is what pushes a check onto everything instead of a sample. Tool-call
guardrails, checked before an agent executes a refund, an email, or a record
deletion, only work if they run on every call, not a sampled subset, and $0.042
per million tokens is what makes that affordable. The same logic covers
verifying a generative model's own output before it reaches a user, triaging
every incoming ticket before a generative model touches the queue, running a
policy check on every expense or procurement approval, and routing every request
to a cheap or expensive model based on how complex it actually is.

## The Jevons bet, applied

Cheaper coal didn't reduce coal use, it multiplied it. TypeSafe is betting the
same happens to AI decisions: every order of magnitude drop in the cost of a
judgment call unlocks more places willing to make one. Confidence isn't
correctness, and a bounded answer space isn't the same as a right answer, so the
caveats are real. But if the bet holds, the interesting design question stops
being "which model should answer this" and becomes "which of these decisions
were we not checking at all, because checking used to cost too much."

← [Specs In, Code Out](/2026/02/22/specs-in-code-out/)
