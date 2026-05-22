---
layout: post
title: "The Sub-Agent Layer: Engineering at a New Scale"
date: 2026-05-22
description: "Google I/O and Code with Claude 2026 both announced multi-agent orchestration at production scale. The bottleneck now is not model power but decomposition quality and evaluation infrastructure."
---

At Google I/O last week, Sundar Pichai described how multi-day engineering efforts are collapsing into hours. The mechanism behind that claim is not a faster individual agent. It is a coordination architecture: a planner that decomposes work, specialized sub-agents that execute components in parallel, and an evaluator that validates the result against the original intent. Google calls the system Antigravity 2.0. Anthropic announced Managed Agents the week before at Code with Claude in San Francisco. The pattern is the same across both platforms, and it is arriving at production scale fast enough that most engineering teams are not yet thinking about what it requires of them.

The mental model that most engineers carry into this shift is wrong in a specific way. They think of a sub-agent system as a faster single agent. A bigger machine doing the same work quicker. That framing predicts none of the real constraints you encounter in practice, and it misses the leadership problem entirely. The right mental model is a small engineering team with specialized roles and explicit handoffs, operating under time pressure, where the coordination structure determines the outcome more than the raw capability of any individual member.

## Why Single Agents Hit a Ceiling

A single agent working on a substantial problem accumulates context debt. Early in a session, the model has full attention on the problem as stated. Two hours and fifty tool calls later, architecture decisions established in the first twenty minutes start to fade. The agent begins optimizing against what is prominently represented in its current context window rather than against the full set of constraints. Code that emerges at the end of a long session may pass tests that were added recently while quietly violating design decisions that were made early and are no longer foregrounded.

This is not a model quality problem. It is a working memory problem, and it does not get solved by expanding the context window. It gets solved by decomposition: break the problem into discrete scopes, assign each scope to an agent with fresh context and a specific task contract, and orchestrate the handoffs with explicit artifacts rather than relying on one session to carry everything in memory.

The productivity math becomes obvious once you see it clearly. Four agents working on four scopes simultaneously, each with a clean input contract and a testable success condition, produce more coherent combined output than one agent doing the same work sequentially while accumulating context fog. The model is the same. The architecture is different.

## The Planner, Generator, and Evaluator

The architecture that is emerging from production deployments at places like Anthropic and Google shares a three-role structure. A planner takes the overall goal and decomposes it into scoped units of work, producing explicit contracts for each unit that describe what success looks like in testable terms. Generators execute against those contracts, one per scope, without needing to carry the full problem context. An evaluator validates the output, running the application the way a real user would, checking whether the generated result satisfies the contract, and returning structured feedback if it does not.

Anthropic published the internals of this pattern in detail earlier this month in a post on harness design for long-running applications. The key design decision in their architecture was what they called the sprint contract: before any code is written, the planner and evaluator agree on what done means for that chunk of work. The generator then builds against that shared definition rather than against a vague high-level prompt. When the evaluator runs end-to-end tests against the running output and finds gaps, the feedback is targeted and actionable. The generator gets a specific correction, not a diffuse observation.

This pattern is not novel to anyone who has worked on effective human engineering teams. It is how well-run projects work at most scales. An architect clarifies the scope. Engineers build. A reviewer validates against the requirements. What is new is the fidelity with which you can now encode that coordination structure in automated infrastructure, and the speed at which it can execute.

## Decomposition Quality Is the Real Constraint

When a single agent is the unit of work, the skill that matters most is prompt quality. The better you describe the problem, the better the output. That relationship still holds, but it is no longer the primary constraint in a multi-agent system.

In an orchestrated architecture, the primary constraint is decomposition quality. A planner that divides a large feature into scopes that are either too large or poorly defined at their boundaries produces worse outcomes than a weaker model working with a well-designed decomposition. Two agents making incompatible assumptions about shared state during parallel execution creates integration failures that are expensive to diagnose and fix. The problem structure matters more than the model power, up to the point where model capability becomes the limiting factor for individual tasks. Most teams are not at that point yet; their decomposition quality fails first.

This is a skill that engineering leaders need to cultivate deliberately and that most organizations have not started thinking about. The ability to decompose a large feature into tractable, boundary-clean scopes with explicit interfaces is something senior engineers develop over years of practice. It transfers directly to the orchestration problem. But the feedback loops are different from what engineers are used to. In human teams, poor decomposition shows up as integration pain in the final week. In agent orchestration, it shows up faster, usually as a coherence failure in the combined output that looks like a model problem but is actually a coordination problem.

## Evaluators Need Human Backup at the Right Points

The hardest part of multi-agent architecture is not the planning or the generation. It is the evaluation. An automated evaluator can check whether the output satisfies testable criteria. It cannot determine whether the problem being solved is the right problem. It can catch a UI that fails to render or an API that returns the wrong shape. It will struggle to catch a design decision that is technically correct and architecturally wrong.

This is where human judgment remains irreplaceable, and where engineering leaders need to be deliberate about placement. The appropriate human checkpoint is not at every agent step; that would eliminate most of the throughput advantage. It is at the contract definition stage, before the generators start, when the planner's decomposition is reviewed for correctness of scope and clarity of success criteria. Human review of the contract produces far more leverage than human review of the generated code, because errors in the contract produce systematically wrong output across the entire generator run, while errors caught in code review tend to be local.

The evaluator pattern also requires actual investment in test infrastructure. An evaluator that can only verify compilation is not providing meaningful signal. An evaluator running end-to-end tests against a live instance, checking real user flows and API surface, is providing signal that compounds across every generation cycle. Teams with strong test infrastructure find multi-agent architectures multiply that investment immediately. Teams with weak test infrastructure discover that building the evaluator is the first thing they need to do.

## The Scale Is the Organizational Point

There is a tendency to treat multi-agent orchestration as a capability that allows individual engineers to move faster. It does, but that framing understates the shift. The more significant change is what a small, well-organized team can actually take on.

A single engineer with one agent produces more than a single engineer without one. An engineering leader who understands how to set up orchestration architecture, decompose work with clean boundaries, define testable contracts, and maintain an evaluator layer changes what a small team can tackle. Projects that previously required four engineers coordinating over two weeks may require one engineer who knows how to structure the decomposition. Projects previously scoped for an entire team may compress to two people with the right orchestration infrastructure in place.

Google's internal adoption numbers give some sense of the scale already in motion. In March they reported processing half a trillion tokens per day internally across AI developer tools. By the I/O keynote, that number had grown to more than three trillion tokens per day. The infrastructure is running at production scale at the organizations that have figured out the architecture. The question for everyone else is not whether to engage with multi-agent patterns, but whether their decomposition skills, contract discipline, and evaluation infrastructure will be ready when the pressure to match that productivity arrives.

The teams that come out ahead are not the ones with access to the most capable models. They are the ones that have thought hardest about the shape of their work: which scopes are genuinely clean, which contracts are actually testable, and where human judgment needs to sit in the pipeline to keep the system pointed at the right problems. That clarity has always been the job of good engineering leadership. The stakes for having it, or not having it, just went up considerably.
