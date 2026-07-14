---
layout: post
title: "Comprehension Debt Is the New Technical Debt"
date: 2026-06-12
description: "Agents ship code faster than teams can build mental models of it. The debt accumulating is not in the code itself but in the understanding required to maintain, diagnose, and evolve it."
---

The concept of technical debt has been useful for decades because it gave engineers a language to explain invisible costs to people who preferred to see only visible output. You borrowed against quality to ship faster, and the interest compounded until you paid it down. Everyone understood the metaphor well enough to make it a planning input.

There is a newer kind of debt accumulating in teams that have adopted AI-assisted development, and most organizations do not yet have a name for it. The code is often fine. The tests pass. The deployment goes cleanly. What is missing is the understanding that a team would normally carry alongside code they authored. Call it comprehension debt: the gap between what has been shipped and what the team genuinely understands about what was shipped.

## How Understanding Used to Travel

When engineers wrote code by hand, comprehension was a byproduct of the writing. The person who implemented the function understood it. The reviewer who read it carefully held some model of the design choices and their implications. The team that participated in the pull request discussion absorbed the tradeoffs, even imperfectly. Understanding traveled with code through the process of being made.

This was never perfect. Code review is often shallow. Context degrades over time. The engineer who built a system leaves, and what they knew leaves with them. Technical debt accumulates at the seams where understanding was never written down.

But the process created ambient understanding across the team, and that ambient understanding was the invisible foundation for everything that came after. Debugging relied on it. Incident response relied on it. Onboarding relied on it. Architectural decisions relied on it. Teams make better decisions about systems they understand, even partially.

## What Changes When an Agent Generates the Code

When an agent generates code from a prompt, the output can be correct and often is. At Shopify, reversion rates on AI-assisted code have remained roughly equivalent to pre-AI baselines. The quality problem is not what most critics claimed it would be. The code often works.

But the process that produces agent-generated code does not create the same ambient comprehension that writing creates. The engineer who reviewed and merged the pull request may understand what the code does in aggregate. They are unlikely to understand why specific boundaries were drawn where they were, what edge cases were explicitly handled versus implicitly assumed, or which structural choices reflect sound reasoning versus the path of least resistance from the model's training distribution.

This is the comprehension debt: not a quality gap but an understanding gap. The code exists. The mental model that makes it maintainable does not exist in the same form.

## Why This Debt Is More Dangerous Than Technical Debt

Technical debt slows you down in predictable ways. Systems become harder to change. Features take longer. The relationship between the debt and its cost is legible enough to manage, even if managing it is unpleasant.

Comprehension debt fails differently. You do not know you are carrying it until something breaks and you cannot explain why. An incident surfaces a bug in a module that everyone thought they understood. The on-call engineer opens the code and realizes they recognize its structure but cannot reason about its behavior. The code review that approved it was looking at correctness, not at whether anyone had genuinely internalized the design.

The feedback loop that normally converts production failures into improved engineering behavior is weaker when comprehension debt is high. When an engineer breaks code they wrote, they learn something about the system. When an incident traces to code no one on the team truly understood, the learning is superficial. You fix the specific failure. You do not update your mental model of the system in a way that prevents the next one. The same class of error recurs not because the team is careless but because the understanding required to anticipate it was never there.

This is why comprehension debt compounds faster than technical debt. Each incident that fails to produce real learning increases the probability of the next incident. Each new agent-generated module added on top of previous agent-generated modules that no one fully understood increases the opacity of the whole. The accumulated surface area of code that exists without a corresponding mental model grows with every sprint.

## What Teams That Are Handling This Well Actually Do

The organizations that have recognized this problem share a few structural responses. None of them require reducing the pace of AI-assisted development. They require changing what the process expects of engineers alongside it.

The most concrete version comes from Farhan Thawar at Shopify: engineers must understand systems two to three layers below where they are actively working. Not the entire codebase. Not every implementation detail. But enough depth that when something fails, they can reason about where and why without treating the codebase as a black box. This is not a punitive standard. It is the minimum comprehension required to actually maintain and evolve what you've shipped.

The second pattern is treating explanation as a required output, not an optional one. Before merging code, the engineer who reviewed it should be able to explain the design in their own words, describe the main risk the implementation takes, and identify which assumptions would cause it to fail. If they cannot do that, the code is not ready to merge regardless of whether the tests pass. Understanding is a quality gate, not just a courtesy.

Third, the review process should use agents for mechanical checks and reserve human attention explicitly for comprehension. An agent scanning for correctness, style, and coverage is faster and more consistent than a human doing the same scan. The human reviewer's job is to decide whether the code is solving the right problem in a way the team can maintain and evolve. These are different questions that require different cognitive engagement. Conflating them produces reviews that technically happened but did not build the understanding that reviews are supposed to transfer.

## The Organizational Signal Worth Watching

Teams that are accumulating comprehension debt at a dangerous rate share a recognizable pattern: they can ship but they cannot diagnose. New features land on schedule. Incident response slows down. Architectural discussions become abstract because the people in the room are not confident enough in their model of the existing system to reason about changes to it. Onboarding gets harder not because the codebase is poorly organized but because there is less ambient knowledge to transfer.

The leading indicator to watch is not incident frequency but incident resolution time. If incidents are being resolved by the person who happened to write the code or run the original prompt, rather than by any competent team member, comprehension debt has already accumulated past the point where it is easy to address. The understanding that should be distributed across the team has become concentrated in individuals, and those individuals are one departure away from leaving everyone else in the dark.

The throughput gains from AI-assisted development are real. But throughput is not the same thing as progress. Shipping code you do not understand is a faster way to build something you cannot maintain. The teams that will still be moving fast two years from now are not just the ones that adopted agents earliest. They are the ones that treated comprehension as a first-class property of the code they shipped alongside those agents.
