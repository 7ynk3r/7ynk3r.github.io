---
layout: post
title: "Interviewing in the AI Era Means Following One Problem End to End"
date: 2026-04-21
description: "A stronger interview loop starts with an AI-allowed take-home and then tests judgment, depth, and adaptability by extending the same problem onsite."
---

Most interview loops are still optimized for a world that no longer exists. We keep pretending the core signal comes from watching someone type code under pressure, without tools, inside a narrow time box, as if that resembles how meaningful engineering work is done today. It does not. The modern workflow includes AI, code search, docs, logs, and iteration. An interview that ignores that reality is not rigorous. It is simply disconnected from the job.

The more useful question is not whether a candidate can produce code alone in forty minutes. The useful question is whether that candidate can take a messy problem, use modern tools well, make sound tradeoffs, and evolve a solution with clear reasoning. If that is what we want to measure, the interview has to follow a different structure.

## The Take-Home Should Be Real Work, Not Trivia

The first stage should be a take-home assignment where AI use is explicitly allowed. That policy does two important things immediately. It removes the performative game of pretending people do not use modern tools, and it shifts evaluation from raw typing speed toward engineering judgment. If the assignment has enough complexity, the candidate still has to decide architecture, boundaries, error handling, testing strategy, and scope control. AI can assist with implementation, but AI does not make those decisions for them.

A good take-home should feel like a thin slice of production work. It should be large enough to expose multiple design paths and small enough to complete in a reasonable window. It should include constraints that force prioritization. It should be open enough to reveal how the candidate thinks, but concrete enough that a reviewer can judge whether the solution is coherent.

Providing tests can be useful, especially when you want a baseline of correctness across submissions, but tests are not the only source of signal. Even without a formal test harness, a thoughtful submission still shows structure, assumptions, naming, organization, and risk awareness. In many cases, you can learn more from how someone frames the problem than from whether every edge case was fully covered in limited time.

## Review the Submission Like a Pull Request

Before inviting someone onsite, review the take-home exactly as you would review a peer's pull request. Read it for maintainability, not only for correctness. Ask whether the architecture is easy to extend. Ask whether the abstractions are justified. Ask whether the code reads like something you would want on your team six months from now.

This review will never be perfect, and that is fine. In fact, imperfections are useful because they generate real discussion prompts for the next stage. The goal is not to "catch" the candidate. The goal is to identify technical decisions worth examining in a collaborative conversation.

When teams skip this step, they often waste onsite time rediscovering first-pass impressions that could have been prepared in advance. When teams do this step well, onsite interviews become sharper because every discussion starts from concrete artifacts rather than hypotheticals.

## Onsite Starts with Candidate-Led Peer Review

The onsite should begin with the candidate walking through their own submission. This is where depth becomes visible very quickly. People who truly understand what they built can explain why they chose one approach over another, what tradeoffs they accepted, and what they would change with more time. People who only assembled output without understanding it struggle as soon as the conversation leaves the happy path.

Treat this conversation like a real engineering review, not like an oral exam. Raise questions from your pre-review. Challenge a boundary choice. Ask what breaks under load. Ask how they would validate a risky assumption. Ask which parts are most likely to generate operational issues after deployment. The point is to observe how the candidate reasons in the same collaborative pressure your team faces every week.

This format also evaluates communication quality, which becomes more important as AI accelerates implementation. Teams increasingly fail at handoffs and alignment, not at syntax. Engineers who can explain complex decisions clearly and absorb feedback productively create disproportionate leverage.

## The Highest-Signal Step Is a Live Extension

After the walkthrough, ask the candidate to extend the same solution with a new requirement. Add a feature. Introduce a constraint. Change an assumption. Request an operational guardrail. Anything that forces modification of existing design rather than fresh coding from scratch.

This is the strongest signal in the entire process because software work is mostly change, not greenfield creation. Extending an existing system reveals whether the candidate actually understood the original problem, whether their architecture can absorb new requirements, and whether they can make incremental progress without destabilizing what already works.

It also resolves the anxiety many teams now have around AI-assisted submissions. If someone cannot reason about their own code, they will fail quickly when asked to evolve it. If they can extend it coherently under discussion, then the interview has validated the capability that matters in production.

## Keep System Design and Algorithms, but Rebalance Their Role

The traditional modules still belong in the loop. System design remains essential for evaluating decomposition, scaling instincts, and resilience thinking. Algorithms and data structures still matter for reasoning precision and complexity tradeoffs. Time and space analysis still matter when systems hit real constraints.

But these modules should no longer carry the entire hiring decision. They should complement evidence gathered from the end-to-end problem flow. In other words, fundamentals remain necessary, but they are no longer sufficient as standalone proxies for day-to-day engineering effectiveness.

When a candidate has already demonstrated practical implementation, code review maturity, and the ability to extend a live solution, a system design conversation becomes richer and more predictive. It moves from abstract performance to applied judgment.

## Interviews Should Reflect the Work We Actually Do

The core change is simple. Stop treating interviews as disconnected tests. Treat them as one continuous engineering narrative. A candidate starts with a realistic problem, submits a solution in the same AI-assisted reality we all now operate in, defends it in a peer-level discussion, extends it under new requirements, and then demonstrates foundational reasoning in system design and algorithmic analysis.

That sequence aligns with modern engineering work far better than isolated coding drills, and it produces stronger hiring signal with less theatrics. In a world where code generation is increasingly commoditized, the real differentiator is still human judgment: what to build, why to build it, how to validate it, and how to evolve it safely. Interviews should be designed to find exactly that.
