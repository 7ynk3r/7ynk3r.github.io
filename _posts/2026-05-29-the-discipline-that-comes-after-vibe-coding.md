---
layout: post
title: "The Discipline That Comes After Vibe Coding"
date: 2026-05-29
description: "Vibe coding raises the floor. Agentic engineering raises the ceiling. The gap between them is not a tooling gap. It is a discipline gap, and it shows up exactly where teams stop paying attention."
---

At Sequoia Ascent 2026, Andrej Karpathy drew a line that is worth sitting with. Vibe coding raises the floor, he said. It lets almost anyone describe what they want and get working software. Agentic engineering raises the ceiling. It is the professional discipline of coordinating fallible agents while preserving correctness, security, and the quality bar you are still responsible for.

The line is clean in the abstract. In practice, most teams that have adopted AI coding tools are operating somewhere between the two without knowing it. They have agents running. They have workflows that look agentic. And they have a slow accumulation of code that nobody fully owns.

The gap between vibe coding and agentic engineering is not a tooling gap. It is a discipline gap, and it compounds silently.

## What Vibe Coding Gets Right, and Where It Stops

There is nothing wrong with vibe coding as a starting point. Karpathy coined the term to describe something real and genuinely useful: the ability to describe what you want and get working software, without friction, without needing to know every API. It lowered the activation energy for building by an enormous amount. Personal apps that would have taken a week can now take an afternoon. Prototypes that required specialized skills are now accessible to anyone who can describe the problem clearly.

The issue is not that vibe coding is wrong. The issue is that it was never designed for production software with real users, security boundaries, and failure modes that cost money. Karpathy made this concrete with a story about MenuGen, his restaurant menu app. His agent tried to match Stripe purchases to Google accounts using email addresses. Plausible logic. Wrong design. The Stripe email and the Google login email can differ. The agent did not know about user IDs as persistent identifiers because that requires understanding the shape of the system, not just the surface of the task.

This class of error is not a prompt engineering problem. It is not fixed by a better model. It shows up because agents operate on the available context, and the available context does not always include the systemic understanding that would prevent a plausible-looking mistake. That understanding has to live somewhere. In a vibe coding workflow, it often lives nowhere.

## Understanding Cannot Be Delegated

Karpathy ended the talk with a line worth quoting directly: you can outsource your thinking, but you can not outsource your understanding.

This is the precise point where vibe coding and agentic engineering diverge. Vibe coding, taken to its limit, outsources both. You describe the goal, accept the output, and ship. In the short run this is fast. In the medium run it produces a codebase that nobody genuinely understands, being maintained by people who have not developed the mental model that would let them catch the MenuGen-class mistake before it reaches production.

Agentic engineering keeps understanding inside the team. Agents write the code. Humans design the spec, review the diff for architectural correctness rather than syntax, and build evaluation loops that require articulating what good looks like. Those activities are not overhead on top of the real work. They are the work, because they are how understanding stays alive inside the system.

This matters more as agent output volume scales. The DORA 2026 data showed incidents per pull request up 242 percent after AI adoption. Most of that gap is not agents generating objectively wrong code. It is agents generating plausible code that humans approved without fully understanding what they were approving. The review existed. The understanding did not.

## The Three Habits of Agentic Engineering

There is no certificate for agentic engineering. It is a collection of habits that either exist in a team's practice or do not.

The first is spec-first work. Before a prompt, there is a document: what the feature does, what it explicitly does not do, what the user ID is and why email addresses are not an acceptable substitute. The spec does not have to be long. It has to exist and be specific enough that an agent working from it makes the right choice when the plausible choice and the correct choice diverge. Teams that skip this step are not saving time. They are borrowing time from the debugging budget.

The second is reading diffs for architecture. Agents are good at syntax. They follow conventions, match style, and pass tests. The things they miss are the things that require understanding the system boundary: where data crosses a trust boundary, where an assumption about user identity is load-bearing, where a caching decision will break something three refactors from now. These are not visible in the test output. They are visible only to someone who reads the diff with the question "what does this change assume about the system?" rather than "does this compile?" Code review in the agentic era is not a faster version of the old code review. It is a different activity with a different cognitive posture.

The third is building evals before they are urgent. Evals are the mechanism by which agent output quality creates a feedback loop. Without them, observability exists (teams can see what agents are doing) but quality measurement does not (teams cannot tell whether what agents are doing is correct at the level that matters). The LangChain 2026 state of agent engineering report found 89 percent of teams running observability for their agents and 52 percent with evals. That 37-point gap is not a minor metric. It is the space in which quality regressions happen invisibly until they become incidents.

## The Ceiling Is Actually High

None of this is an argument for slowing down. Karpathy's point about the ceiling is worth taking seriously. The throughput available to a team that has developed these habits is not incrementally better than the throughput available to a team vibing it out. It is categorically different, because it does not plateau at the quality boundary. Teams that cannot maintain understanding at higher velocity eventually stop. Teams that can maintain understanding continue to compound.

The person who masters agentic engineering, in Karpathy's framing, may outperform not by 10x but by far more. The limiting factor is not model capability. It is the human side of the loop: the clarity to write a spec that catches the user ID mistake before the agent makes it, the judgment to review a diff for the architectural assumption that tests will not surface, the discipline to build evals before the regressions have already shipped.

Vibe coding democratized building. Agentic engineering is what makes that building durable. The floor matters. So does the ceiling. And the ceiling is built not from better models but from the discipline of the people directing them.
