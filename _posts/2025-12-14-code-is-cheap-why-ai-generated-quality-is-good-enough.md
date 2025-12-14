---
layout: post
title: "Code Is Cheap: Why AI-Generated Quality Is Good Enough"
date: 2025-12-14
description: "The shift from perfect code to good-enough code, and why build times and release processes are the real bottlenecks in modern software development"
---

We've spent decades optimizing for code quality. Code reviews, static analysis,
comprehensive test coverage, and meticulous architecture reviews—all in service
of writing perfect code. But here's the uncomfortable truth: in an AI-first
development world, code quality isn't the bottleneck anymore. The code itself
has become cheap.

Think about Photoshop. For the vast majority of users, the free or low-cost
versions handle 90% of what they need. If you need pixel-perfect precision for
professional work, you pay a premium. But for everyone else, good enough is
actually good enough. The same principle applies to AI-generated code.

## The Quality Threshold Has Shifted

AI-generated code quality has reached a point where it's comparable to—and often
better than—human-written code for most use cases. This isn't about perfection.
It's about recognizing that the quality bar for most code doesn't need to be
perfect. Just like Tesla's Full Self-Driving doesn't need to be flawless to be
better than human drivers in most scenarios, AI-generated code doesn't need to
be perfect to be better than what most teams produce under time pressure.

The implications are profound. When code quality is no longer the primary
constraint, what becomes the bottleneck? Build times and release processes.
These are the real slow downs, along with human gates in the development
workflow.

## The Real Bottlenecks

While we've been obsessing over code quality, the actual friction points have
shifted. Build times that stretch into minutes or hours. Release processes that
require multiple approvals and manual steps. Human gates where engineers wait
for reviews, approvals, or decisions. These are the constraints that actually
limit velocity.

When code generation takes seconds but builds take minutes, the math doesn't
work. I've seen teams generate a complete API endpoint in 30 seconds, only to
wait 12 minutes for the build to complete. When you can generate a feature in an
hour but wait three days for it to ship through approval processes, you're
optimizing the wrong thing. The bottleneck isn't writing code—it's getting code
into production.

This shift requires rethinking our entire development workflow. If code is
cheap, we should be generating more of it, testing it faster, and shipping it
more frequently. But our processes are still optimized for the era when writing
code was expensive.

## Sampling Code Like Raw Materials

If you want to keep humans in the loop while optimizing for speed, you can take
samples of generated code for review. This mirrors how quality control works in
manufacturing. When buying mass quantities of raw materials, you don't inspect
every single item. You sample. You trust the process for the majority and apply
scrutiny where it matters most.

By default, use cross-agent checks. Have one AI agent generate code and another
review it. This catches most issues without human intervention. Then sample the
output—review a percentage of the generated code, focusing on critical paths and
high-risk areas. For example, a team generating 50 API endpoints might have AI
agents cross-check all of them, then have humans review 10%—the 5 most critical
endpoints that handle payment processing or user authentication. Most code can
be rewritten from scratch if needed, so the cost of a mistake is lower than the
cost of reviewing everything.

This approach requires a fundamental shift in how we think about code review.
Instead of reviewing everything, we review strategically. We trust the process
for routine code and apply human judgment where it adds the most value.

## The New Economics of Code

When code is cheap, the economics of software development change. The cost of
generating code drops dramatically. The cost of testing and deploying code
becomes the constraint. The value shifts from writing code to understanding what
code to write, when to write it, and how to integrate it into larger systems.

This doesn't mean code quality doesn't matter. It means we need to be strategic
about where we invest in quality. Not every line of code needs the same level of
scrutiny. Not every feature needs the same level of perfection. We can afford to
be more experimental, to try more things, and to learn faster.

The teams that recognize this shift and adapt their processes accordingly will
move faster and learn more. They'll generate more code, test more ideas, and
ship more frequently. They'll treat code as a means to an end, not an end in
itself.

## What This Means for Engineering Teams

This shift has practical implications for how we structure teams and processes.
If code is cheap, we should be generating more of it. If build times are the
bottleneck, we should be optimizing builds. If release processes are slow, we
should be automating them.

It also means rethinking how we measure engineering productivity. Lines of code
written is even less meaningful than it used to be. Time to ship, frequency of
deployment, and ability to experiment become more important metrics. Instead of
tracking "500 lines of code written this week," track "3 features shipped, 12
experiments run, average time from idea to production: 2 days." The teams that
measure what actually matters—impact and velocity—adapt faster to the new
economics of code.

Most importantly, it means recognizing that the value of engineers isn't in
their ability to write code—it's in their ability to solve problems, make good
decisions, and build systems that matter. Code is just the output. The thinking,
the judgment, and the system design are what actually matter.

## The Future of Code

Code is becoming a commodity. This isn't a threat to engineers—it's an
opportunity. When code is cheap, we can focus on what's actually valuable:
understanding problems, designing solutions, and building systems that solve
real problems.

The engineers who thrive in this world aren't the ones who write the most code
or the most perfect code. They're the ones who know what to build, why to build
it, and how to build it sustainably. They're the ones who can work effectively
with AI agents to explore solution spaces and make good decisions.

Code is cheap. Judgment is expensive. And that's where the real value lies.
