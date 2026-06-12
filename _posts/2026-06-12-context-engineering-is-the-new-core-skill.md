---
layout: post
title: "Context Engineering Is the New Core Skill"
date: 2026-06-12
description: "Most agent failures are not prompt failures. They are context failures. The discipline of deciding what an AI agent knows at any given moment is becoming the real engineering challenge of the AI era."
---

When an AI agent gives a wrong answer, the instinct is to improve the prompt. Reword the instruction. Add more examples. Make the task clearer. This reflex has been so thoroughly reinforced over the past few years that "prompt engineering" became its own job title.

The reflex is often wrong. Most production agent failures are not prompt failures. They are context failures. The model did not have the right information when it needed it. It had too much noise and not enough signal. It was reasoning from stale state. It could not distinguish between what it was told in the system prompt and what arrived as untrusted input from an external tool. A better prompt would not have fixed any of those.

This distinction matters enormously for how engineering teams invest their time and attention in the year ahead. Prompt engineering asks: how do I phrase this? Context engineering asks: what does this model know right now, and how should that change as the task evolves?

## What Context Engineering Actually Is

Context engineering is the discipline of designing the information environment around a model. It is not about the instructions you give. It is about everything else: the state the agent carries across turns, the data it retrieves from external sources, the outputs of tools that flow back into its window, the memory that persists between sessions, and the decisions about what to include, compress, or discard as a task grows longer.

Prompt engineering is a subset of context engineering. A good system prompt matters. Instructions matter. But in a production agent, the prompt is one layer among many, and it is rarely the layer that fails first. What fails first is usually the context architecture.

Andrej Karpathy identified this gap directly when he argued that "prompt engineering" undersells the real craft involved in building reliable systems. What he was pointing at was that the discipline is actually about information flow across the entire loop, not just the wording of the entry point. Teams that understand this build fundamentally different systems from teams that treat context as incidental.

## The Four Decisions That Actually Matter

Every production agent requires four structural decisions that determine whether it behaves reliably.

The first is what persists. In a multi-step task, each action produces new information. Prior tool calls, partial results, observations, and corrections accumulate. The system must decide which of those observations carry forward and which get dropped. Carrying everything forward is expensive and eventually counterproductive: older, lower-quality information starts to drown out the higher-quality recent observations. Dropping too aggressively means the agent loses necessary state and makes decisions that contradict earlier reasoning. Persistence policy is a design decision, not a default.

The second is what gets retrieved. For any task that exceeds the context window, retrieval determines what the agent knows. The common failure is treating retrieval as a commodity, as if vector similarity search is always the right answer. In practice, what information is most relevant depends heavily on the stage of the task. Early, broad context is useful. Mid-execution, specific and recent state matters most. Late in a task, the agent may need summary rather than raw detail. Static retrieval configurations do not account for this, and agents built on them degrade as tasks grow longer.

The third is what tools inject. Every tool call returns output that enters the context. Most teams treat tool outputs as trusted data, as reliably as if the model had generated the result itself. This assumption is wrong and becoming a significant security surface: injected content in tool responses, RAG results, or external documents can carry adversarial instructions that redirect agent behavior. The design question is not just what the tool returns but how that return value is handled before it enters the model's reasoning. Context engineering includes input validation at every boundary, not just at the user entry point.

The fourth is what state the agent tracks across sessions. A single-session agent loses all state when the session ends. For long-horizon tasks where a user returns over days or weeks, session-bounded memory means the agent starts cold every time. This is one of the most underbuilt parts of production agent infrastructure. Teams add persistent memory as an afterthought and then discover that its retrieval and compression decisions are among the hardest problems in the whole system.

## Why This Is a Systems Design Problem

The reason context engineering is genuinely hard is that it sits at the intersection of systems design, information architecture, and probabilistic behavior. The failure modes do not look like traditional software bugs. There is no stack trace when an agent loses the thread of a multi-step task because its context window filled with noise. There is no exception when stale retrieved data leads to a decision that would have been correct an hour ago and is wrong now. The system appears to work until it produces a result that makes no sense in the situation, and diagnosing why requires understanding what the model actually saw, not just what you intended it to see.

This is why observability has become essential for anyone building production agents. The teams doing this well treat context as a first-class artifact: something logged, inspected, and analyzed when an agent produces a bad result. They ask what was in the context window when this happened, not just what the model said. That framing shift changes what you instrument and what you investigate.

## The Organizational Gap

Here is the gap most engineering organizations have not yet closed. Prompt engineering was legible enough to assign: somebody on the team wrote prompts. Context engineering is harder to assign because it cuts across infrastructure, retrieval, memory systems, security review, and observability. It does not belong cleanly to any existing role, so no one ends up accountable for it.

This is where engineering leaders have a structural decision to make. Context engineering needs an owner, either as an explicit responsibility on a senior engineer or as a design review step that every agent system passes through before production. Teams that treat it as implicit find out the hard way that no one was actually thinking about it.

The analogy is the shift that happened with distributed systems. Early distributed systems were built by developers who understood networking the way they understood files. The field matured when architects started treating distributed design as its own discipline with its own failure modes and review processes. Context engineering is in that same early stage, moving from implicit assumption to explicit craft.

## What This Means for Teams Building With Agents Today

The immediate implication: stop diagnosing agent failures by examining only the prompt and start diagnosing them by examining the context. Build visibility into what the model actually saw. Track context composition across turns. Add validation at tool boundaries before outputs enter the reasoning loop. Treat memory and retrieval as first-class design decisions rather than configuration choices to revisit later.

The longer implication is about investment. The AI era has already generated a wave of productivity from faster code generation and reduced boilerplate. The next wave will come from agents that stay reliable across long-horizon tasks. That reliability depends almost entirely on context architecture. Teams that invest in it now will carry a structural advantage over teams still optimizing prompts.

Prompt engineering was the right skill for a world of single-turn interactions. Context engineering is the right skill for a world of agents that execute tasks across time, tools, and state. The world changed. The skill set needs to follow.
