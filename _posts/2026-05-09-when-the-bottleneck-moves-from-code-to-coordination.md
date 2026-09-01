---
layout: post
title: "When the Bottleneck Moves from Code to Coordination"
date: 2026-05-09
description: "Running fleets of AI agents in parallel is the new frontier of engineering productivity—but the limiting factor isn't agent capability, it's coordination quality."
---

Boris Cherny, the creator of Claude Code, has not written a single line of code in 2026. He ships twenty to thirty pull requests per day from his phone, running five parallel Claude instances across terminal tabs. Steve Yegge built something he calls Gas Town—a production system managing twenty to thirty concurrent agents across seven specialized roles: coordinator, developer, reviewer, QA, architect, researcher, and infrastructure. These are not experiments. They are workflows that already exist in production, and the people running them are not doing less engineering. They are doing a different kind of engineering entirely.

The pattern behind both setups is the same. When a single AI agent can generate correct code faster than any human, the limiting factor is no longer implementation speed. It is the ability to decompose a complex goal into independent, well-specified subtasks and then reassemble the results into something coherent. That is not something AI does well without human direction. Coordination remains stubbornly human.

## The Collaboration Tax

CooperBench, a January 2026 benchmark measuring multi-agent software projects, found that agents achieve roughly fifty percent lower success rates when collaborating versus working solo. The failure mode is not that agents write bad code. It is that they write code against misaligned assumptions—ambiguous interfaces, missing contracts, divergent interpretations of scope. The bottleneck is not coding ability. It is what researchers are calling social intelligence: the capacity to communicate effectively, maintain commitments, and track what parallel partners are doing.

This is not a temporary limitation waiting on the next model release. It is a structural property of distributed work. Human teams face the same problem. The reason agile sprints, RFC processes, and design reviews exist is precisely because multiple people building toward the same goal will diverge without explicit coordination mechanisms. AI agents have the same divergence problem with fewer social cues to self-correct.

The failure modes are faster and quieter than with human teams. A human engineer who is building against the wrong assumption will surface that in a standup or a Slack message. An agent working in an isolated branch will deliver a complete, confident, well-formatted implementation of the wrong thing—and it will not know that it is wrong.

## Decomposition Is the Hard Part

The practitioners who are running large agent fleets have converged on a pattern independently. An orchestrating agent—or a human—breaks the goal into independent subtasks. Each worker agent receives a scope that is bounded, specification-complete, and does not depend on another agent finishing something first. Workers run in isolated git worktrees so their changes cannot conflict. Results are assembled at the end after quality gates run.

The key word is independent. If task B depends on task A finishing first, parallelism breaks down and you are back to serial execution at a higher coordination overhead. If the scope of a task is ambiguous, the agent will complete it confidently in whatever direction the prompt implies—which may or may not be what you intended. Good decomposition is the skill that makes the rest of the system work.

This is why the orchestrator role in these systems does not write production code. The orchestrator defines scope, manages dependencies between tasks, and verifies that completed work integrates correctly. In Yegge's Gas Town, that role stays human. In the most automated versions, a coordinator agent fills it—but even then, the coordinator's quality is bounded by the decomposition patterns it has learned from human examples.

The engineering investment has shifted upstream. You spend time on how to slice the problem, not on how to implement the solution. That sounds familiar if you have been following the broader trend of [specifications becoming the primary artifact](/2026/01/19/specifications-are-becoming-the-real-source-code/). Decomposition is just another form of that: writing down what needs to exist at each boundary with enough precision that a worker can act on it without asking clarifying questions. The spec is not a document anymore. It is a work order that gates parallelism.

## Trust as an Operating Variable

Anthropic's Q1 2026 agentic coding report found that developers integrate AI into sixty percent of their work but delegate only zero to twenty percent of tasks fully. The gap between usage and trust is the gap between using AI as an accelerator and using it as an autonomous actor. Most engineers still sit in the first category. They are faster, but they are still doing the work themselves.

The barrier to full delegation is not technological. It is the same barrier that exists when you delegate to a junior engineer whose work you have not yet seen. You do not know where their judgment is reliable and where it will miss something critical. The review cost stays high until you have built up a map of what they get right and where they need support.

Agent delegation works the same way. You learn, through repeated experience, where a specific agent configuration produces reliable outputs and where it needs supervision. That knowledge does not transfer automatically between task types or codebases. It has to be accumulated deliberately. Teams that are moving fastest on delegation are the ones who have built a practice of reviewing agent outputs systematically, tracking failure modes, and mapping which task categories are safe to hand off completely.

There is an irony buried in this. The engineers who will be most effective at running agent fleets are not the ones who rush to delegate everything. They are the ones who maintain enough hands-on experience to evaluate whether delegated work is actually correct—and who accumulate, through that evaluation, the judgment about where the agents are trustworthy.

## The New Shape of Engineering Work

The engineering work that remains irreducibly human in a multi-agent system is the work that requires judgment about the whole. Deciding what the goal should be. Deciding which tradeoffs are acceptable when the agents' outputs conflict. Deciding when a completed subtask is good enough to merge and when it needs to be redone. Deciding whether the architecture the agents are building toward is still the right architecture now that requirements have shifted.

These decisions require holding the full context of the product, the team, the constraints, and the users simultaneously. An agent working in a bounded subtask does not have that context unless you give it explicitly—and even then it cannot weight it the way a person who has lived with the product for months can. An agent knows what it was told. It does not know what matters.

This is what engineering becomes when code stops being the bottleneck. Not less demanding—more demanding, in a different dimension. The craft is moving from syntax precision to system clarity. From knowing how to implement a thing to knowing how to divide a thing well enough that others can implement it without stepping on each other.

The teams who will compound the most over the next few years are not necessarily the ones running the most capable agents. They are the ones who develop the strongest decomposition instincts—who can split a complex goal into independent, well-bounded pieces so cleanly that the assembly at the end is almost automatic. That skill is still rare. And unlike raw coding speed, it does not come free with the next model release.
