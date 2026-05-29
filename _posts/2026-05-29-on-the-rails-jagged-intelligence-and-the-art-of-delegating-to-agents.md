---
layout: post
title: "On the Rails: Jagged Intelligence and the Art of Delegating to Agents"
date: 2026-05-29
description: "AI agents can refactor a 100,000-line codebase yet fail to reason about walking to a car wash. Understanding why is the most practical skill an engineering leader can develop right now."
---

Andrej Karpathy posed a question at Sequoia's AI Ascent 2026 that should stop every engineering leader mid-sentence. He asked how it is possible that a frontier model can find zero-day vulnerabilities in a large production codebase yet, when asked whether to walk or drive to a car wash fifty meters away, confidently advise you to walk. The car wash would be closed by the time you arrived, having washed nothing.

This is not a quirk. It is the defining characteristic of AI agents in 2026, and most engineering teams are not accounting for it seriously. The mental model most of us carry is that agents are roughly as capable as a very fast, very knowledgeable engineer. That model is wrong in exactly the way that makes delegation dangerous. Agents are not uniformly capable. They are jagged, which means they are simultaneously more capable than any human in some regions of a task space and surprisingly brittle in others. The line between those regions does not follow the intuitive boundary of hard and easy. It follows a different logic entirely.

## The Formula Behind the Jaggedness

Karpathy's account of why jaggedness exists is worth sitting with. Frontier labs train models using reinforcement learning in verifiable environments. Math problems have answers. Code either passes tests or it does not. A game either results in a win or a loss. When a task has a reliable feedback signal, models can be iterated against it millions of times and their capability in that region compounds quickly. When a task lacks that signal, training does not concentrate capability there, regardless of how important or seemingly "hard" the task is.

The rough formula is: capability in a region scales with how verifiable the task is, multiplied by how much training attention the labs have actually paid to it. These are two separate dimensions. A task can be highly verifiable in principle but still produce weak agent performance if labs have not built reinforcement learning environments around it. Chess improved dramatically from one model generation to the next, not because general intelligence improved uniformly, but because a large amount of chess data entered the training mix at a specific moment. Someone made a decision, and a capability spike appeared.

The practical consequence is that frontier models have no manual. They work brilliantly in some regions and fail strangely in others, and the regions do not announce themselves. You discover them empirically, through your own testing, or you pay for them through production incidents.

## What "On the Rails" Means for Teams

The question engineering teams rarely ask explicitly is: is this task inside a region the agent has been trained on, or is it outside? The question matters more than almost anything else about how you structure delegation.

When a task is on the rails, meaning it lives inside a verifiable region with substantial training attention, agents can run with unusual autonomy. Code refactoring, test generation, dependency upgrades, documentation from tests, vulnerability scanning: these sit comfortably on the rails. The model has been hammered against feedback in these domains for long enough that its outputs are reliable enough to treat as a strong first draft needing review, not reconstruction.

When a task is off the rails, delegation without tight oversight is expensive. System design decisions involving product judgment, architectural choices where the right answer depends on constraints the model was not shown, security decisions that require understanding the threat model of a specific user population: these sit in regions where agent output looks confident and fluent while being structurally wrong in ways that tests do not catch. The MenuGen payment bug Karpathy described is a clean example. The agent matched Stripe credits to Google accounts using email addresses, a perfectly coherent implementation that misunderstands the identity model of the system being built. The code passes every test you can write against the assumption. The assumption itself is the problem.

This distinction reframes what review means. Reading generated code for syntax, style, and test coverage is useful but incomplete. The more important review asks: did the agent have enough context to understand the system it was building into? Did the task require the kind of product or security judgment that sits outside well-trained regions? If so, the review obligation is not mechanical checking; it is conceptual ownership of the decision the agent made on your behalf.

## The Eval as Navigation

The highest-leverage response to jagged intelligence is building evaluations before you delegate, not after incidents accumulate. An eval in this context is a feedback signal that tells you whether the agent output is correct for your specific task, not just syntactically valid. Good evals are the mechanism by which you put a task on the rails for your particular codebase, your particular domain, and your particular constraints.

This is not primarily about testing frameworks or infrastructure. It is about discipline. Most teams evaluate agent output by reading it and trusting their intuition. That works well on the rails, where intuition is calibrated by visible feedback. It works poorly off the rails, where the errors are in the assumptions, not the execution. Building an eval means specifying what correct looks like in terms the agent can be measured against, before you commit to trusting the output.

The connection to specs is direct. A precise specification of a system's behavior is the scaffolding that makes an eval possible. If you cannot write a test that distinguishes correct from incorrect agent behavior for a given task, that is a signal you do not yet have a clear enough spec to delegate that task safely. The spec-first discipline that has become common advice for agentic workflows is not only about giving the agent better instructions. It is about determining in advance whether you are working inside a verifiable region.

## Understanding Cannot Be Outsourced

Karpathy's conclusion was blunt: you can outsource your thinking, but you cannot outsource your understanding. This is not a limitation that will disappear when models improve. It is structural to the relationship between human judgment and agent capability.

An engineering leader who has fully delegated a system's design to agents may have shipped working software without building the understanding that makes future decisions possible. When the next change arrives, and it always does, the review obligation has nowhere to anchor. You are reading a diff in a system you do not understand, generated by an agent that made assumptions you cannot verify because you were not in the reasoning loop when they were made.

The teams that are getting this right in 2026 are not the ones that have delegated the most. They are the ones that have delegated precisely: on-rails tasks move fast and mostly unattended, off-rails tasks get human attention proportional to how far outside verifiable regions they sit, and evals are the instrumentation that tells you which is which. That calibration is not a product of better models. It is a product of understanding the models you have.

The agents are extremely powerful. They are also jagged in ways that do not announce themselves. The engineering skill that matters most right now is learning to navigate that terrain rather than pretending it is flat.
