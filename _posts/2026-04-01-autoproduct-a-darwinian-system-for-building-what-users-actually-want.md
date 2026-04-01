---
layout: post
title: "AutoProduct: A Darwinian System for Building What Users Actually Want"
date: 2026-04-01
description: "Karpathy's AutoResearch loop can be extended from model experiments to product strategy, backlog generation, and continuous feature evolution."
---

Imagine a team spending ninety minutes debating a single roadmap item. Smart people, strong arguments, solid data, and still no real answer. The meeting ends with a compromise nobody loves and a release plan nobody truly believes in.

That is the old model. Strategy is episodic, planning-heavy, and only occasionally corrected by real usage data. The new model is different: product strategy runs as a continuous evolutionary loop, where ideas are generated, tested in production, selected by outcomes, and replaced when they fail.

Karpathy's AutoResearch points to the pattern. In that loop, an agent edits code, runs an eval, keeps what improves the score, and discards what does not. Applied to model research, this feels natural. Applied to product development, it looks radical until you notice we already do a slower, less consistent version of it. We ship changes, wait for behavior, and decide what survives.

The real shift is not that agents can write code. The shift is that product work can be treated as search.

## Product Development Is a Search Problem

Most roadmaps are expressions of confidence. But confidence is not the same thing as evidence. Before users interact with a change in real conditions, most product decisions are still informed guesses.

Seen through an evolutionary lens, every product decision is a mutation candidate. Rewrite onboarding copy. Remove one signup step. Change default settings. Move the paywall. Preload a result before a click. Adjust notification timing. Offer a different first-run workflow. Each of these creates a variant of the product. The market provides selection pressure.

When a team can generate and evaluate variants faster, it learns faster. When it can evaluate with discipline, it compounds.

## Where Product Loops Get Hard

In model training, feedback can be immediate. In product systems, truth is delayed and noisy. Conversion may need a day of traffic. Retention may need a week. Revenue impact may depend on seasonality and segment effects. Support burden may lag deployment by days.

So the loop becomes asynchronous. Agents generate and ship bounded experiments behind flags. The system waits for an observation window, scores outcomes, and either promotes, iterates, or reverts. While one experiment waits for D1 or D7 signal, other experiments continue in parallel.

This is where many teams fail. They optimize for experiment velocity without investing in evaluation quality. A fast mutation engine with weak selection criteria does not produce progress. It produces churn.

In practice, eval becomes the product operating system.

## Goodhart's Law at Product Scale

Single-metric optimization is fragile. If an agent is rewarded only for conversion, it can discover manipulative tactics that increase short-term clicks and erode long-term trust. If it is rewarded only for engagement, it may optimize for time spent rather than value delivered.

A Darwinian product system needs multi-objective scoring and hard constraints. Some trade-offs are acceptable. Some are not. Crash regressions, security violations, and policy breaches should be non-negotiable kill conditions, not soft penalties.

This is the governance layer people underestimate. The hardest artifact in an autonomous product system is not a prompt. It is a constitution: what must always be optimized, what can be traded, and what must never be sacrificed.

## Extending the Loop Upstream: AutoBacklog

The more interesting move is not only mutating shipped features. It is mutating strategy inputs.

Agents can continuously parse support tickets, call transcripts, product analytics, public reviews, competitor changelogs, pricing pages, and community discussions. From that stream, they can infer repeated pain clusters, detect emerging demand shifts, and propose initiative candidates with explicit assumptions and confidence estimates.

Another layer of agents can map those opportunities to your current architecture and delivery constraints, producing backlog options that are both market-aware and implementation-aware. Instead of quarterly prioritization rituals dominated by opinion weight, you get a living backlog frontier that updates as evidence changes.

Product leadership does not disappear in this model. It becomes more important. Humans still define the mission, user hierarchy, and ethical boundaries. Agents can expand the option set and accelerate execution, but they cannot decide what kind of company you are trying to be.

## Time and Tokens Become Capital Allocation

Once agents can generate more ideas than teams can safely evaluate, the core management problem changes. Engineering capacity is still a constraint, but evaluation bandwidth and inference budget become first-class constraints too.

Not every idea deserves expensive reasoning or long observation windows. Low-cost models can generate and filter broad hypotheses. Mid-tier models can implement and instrument promising variants. High-capability models can be reserved for ambiguous results, cross-metric trade-off analysis, and high-risk decisions. Fast proxy signals can triage candidates before slower behavioral metrics confirm value.

This is portfolio management applied to product development. You are allocating time, traffic, and tokens across uncertain bets while preserving system stability.

## What Teams Actually Need to Build

Most organizations do not need full autonomy immediately. They need reliable scaffolding.

They need safe mutation surfaces with feature flags and rapid rollback. They need instrumentation that captures both business outcomes and quality regressions. They need evaluator pipelines that can separate signal from noise and account for lagging effects. They need policy enforcement that blocks unacceptable variants automatically. They need review loops where humans audit not just outputs, but also whether the fitness function is steering behavior in the intended direction.

The immediate goal is not "remove humans from product." The immediate goal is "move humans to higher-leverage decisions and let the loop run faster between decisions."

## The Role Shift Already Happening

As these systems mature, role definitions shift.

Engineers spend less time on repetitive implementation and more time on experiment infrastructure, observability, and guardrail design. Product managers spend less time writing static roadmaps and more time defining objectives, constraints, and evidence thresholds. Design moves closer to evaluation design, because qualitative quality must be represented in the scoring system if it is going to survive automated selection.

The unifying skill becomes objective design. Teams that define fitness clearly will improve quickly. Teams that define it poorly will optimize themselves into local maxima that look good on dashboards and feel bad in real use.

## The Direction Is Clear

The near term is hybrid. Human judgment remains central. But the structure is changing from roadmap-first execution to loop-first adaptation.

In a roadmap-first model, the core question is what we will ship next quarter. In a loop-first model, the core question is what selection environment we are creating and what behaviors that environment will reward.

Karpathy's AutoResearch showed that autonomous variation and selection can accelerate model progress. The same pattern, applied carefully, can reshape product development end to end: from market sensing to backlog generation, from implementation to rollout decisions, from static planning to continuous adaptation.

In that world, competitive advantage comes less from who can ship a feature and more from who can design a trustworthy evolutionary system around users.
