---
layout: post
title: "Embrace the Exponentials in Your Team"
date: 2026-05-14
description: "Operating at exponential pace is not about working harder. It is about restructuring how work flows: parallel streams, shallow planning, closed loops, and agents doing the building."
---

Most teams that adopt AI tools do not change how they work. They add a faster code editor to the same workflow, the same sprint rituals, the same planning overhead, the same single-threaded execution. The tools get faster. The output barely moves. The reason is that the bottleneck was never typing speed. It was the operating model.

Crossing from linear to exponential output requires changing the structure of how work flows through your team. Not the tools alone. The habits, the process, the way work is queued and executed and reviewed. Here is what that actually looks like in practice.

## Run Multiple Work Streams in Parallel

The single biggest structural change is moving from one work stream to many. In practice this means running multiple copies of the repository simultaneously: separate worktrees or separate clones, each on its own branch, each with an agent working through a discrete problem. When one stream gets blocked on a review, a flaky dependency, or an ambiguous requirement, you do not stop. You switch to the next one and let the agent continue when the blocker resolves.

Cloud environments extend this further. You are not limited to what fits on your local machine. Each work stream can run in its own isolated box, and you move between them as a foreman moves between workers, checking progress, unblocking, steering direction. The limit is cognitive, not technical. More than five parallel streams and your ability to maintain context across all of them degrades fast enough to cancel the gains.

The mental model shift is significant. You are no longer a single-threaded producer. You are a scheduler and a reviewer, and your job is to keep the streams moving, not to do the building yourself.

## Keep the Backlog Deep

Parallel work streams only help if there is always something to work on. This is where PMs and EMs face a new failure mode that did not meaningfully exist before: the backlog running dry.

When execution capacity was the constraint, a two-week backlog felt healthy. There was always more work queued than the team could ship. Now, with agents running multiple streams simultaneously, that buffer evaporates quickly. The PM who still prepares work on a sprint-by-sprint cadence will find engineers and agents sitting idle waiting for the next well-defined task.

The new operating model requires the backlog to stay roughly three times deeper than current execution capacity. Not because all of it will get built, but because agents and engineers should never be the bottleneck in their own pipeline. The moment an engineer has to stop and ask what to work on next, the system has failed. That is a PM and EM problem, not an engineering problem.

## Identify Your Closed Loops

Not all work requires human involvement at every step. Closed loops are the parts of the codebase where an agent can iterate autonomously: a well-defined scope, a test suite that functions as a fitness function, and a low cost of reverting if something goes wrong. Performance improvements, test coverage gaps, dependency upgrades, dead code removal, accessibility fixes. These are areas where you can hand off a task, let the agent run, and review the outcome rather than the process.

The value of closed loops is compounding. Once you identify them, they can run in the background across multiple cycles, returning results for human review without consuming your active attention. They are also a useful calibration tool: the quality of an agent's output on a closed loop tells you how much latitude to grant it on more open-ended work.

Start by cataloging where your test coverage is strong enough to make agent iteration safe. Those are your first closed loops.

## Ship Behind Flags, Always

The fear that slows teams down is not technical. It is psychological. Engineers hold back changes because they are not sure they are ready. PMs delay releases because something might break. The process accumulates review gates and staging cycles that exist to manage anxiety more than to catch real errors.

Feature flags collapse that anxiety. If a change is gated behind a flag, it is not really released until you choose to enable it. You can deploy continuously and release deliberately. The addition cannot break the current system because the current system does not see it until you decide it should.

This changes the rhythm of development significantly. Merging and deploying become low-stakes routine events. The release decision is decoupled from the deployment decision. Teams that internalize this stop treating deployments as moments of risk and start treating them as infrastructure hygiene, which is what they should always have been.

## Use RFCs for Big Features, Agents for Code Review

Human review time is expensive and finite. It should go where human judgment is genuinely irreplaceable.

For large features, that place is the RFC. Before an agent writes a line of code on a significant new capability, a short written document should describe what is being built, why, and how the main pieces fit together. This is not a heavyweight design process. It is a one-to-two page artifact that gives both the agent and the team a shared model of what success looks like. Without it, agents and engineers make incompatible assumptions in parallel and the integration cost is brutal.

For code review, the calculus is different. An agent reviewing a pull request for correctness, style consistency, test coverage, and obvious edge cases is faster and more consistent than a human doing the same scan. Human reviewers should focus on whether the code is solving the right problem, not on whether the variable names follow convention. Use agents to surface the mechanical issues, and reserve human attention for the judgment layer.

The distinction is simple: RFCs get human review because they define intent. Code gets agent review because agents can verify execution against intent more reliably than humans checking line by line.

## Stop Touching Code by Hand

The hardest habit to break is opening the editor and making the change yourself. It is almost always faster in the moment. You know exactly where the file is, you know what needs to change, and the three-second edit feels more efficient than writing a prompt and reviewing the output. That instinct is correct in the short term and damaging in the long term.

Every time you reach into the codebase directly, you are reinforcing a workflow that does not scale. The engineers and teams operating at exponential pace have rebuilt their default behavior: the agent codes, the human directs and reviews. That shift requires deliberately practicing the slower path until it becomes the faster one.

This is not a rule to follow religiously. There are moments where a direct edit is the right call. The point is to notice when the reflex to do it yourself is habit rather than judgment, and to resist it. The throughput difference between a team where everyone has crossed that threshold and a team where most people have not is not incremental. It is the difference between two curves that are moving apart.

## Plan Less, Try More

The last shift is the most counterintuitive for anyone who has spent time in a process-heavy organization. Planning costs have not changed. Coordination meetings, product discovery sprints, market validation cycles, GTM alignment: all of this consumes roughly the same time it did five years ago. Implementation costs have collapsed. This means the ratio that once justified heavy upfront planning no longer holds.

For reversible decisions, the bias should be strongly toward building and testing over planning and validating. If you are unsure whether a feature is worth building, the cost of building a version behind a flag and watching what happens is often lower than the cost of the research process that would have given you a confident answer three months later.

The process that survives this recalibration is the RFC: a lightweight artifact for irreversible or high-coordination decisions. The process that does not survive it is the discovery ritual performed before every feature, regardless of stakes. Most features are reversible. Most discovery cycles are expensive. The teams moving fastest have noticed this and adjusted.

Build more. Validate in production. Reserve the planning overhead for the decisions that genuinely cannot be undone.
