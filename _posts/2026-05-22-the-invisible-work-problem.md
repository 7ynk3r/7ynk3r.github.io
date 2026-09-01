---
layout: post
title: "The Invisible Work Problem"
date: 2026-05-22
description: "Velocity metrics look great. But nearly a third of engineering time now goes to work that never appears in any dashboard. That gap is where quality erodes and burnout builds."
---

The Harness State of Engineering Excellence 2026 report opens with a finding that should unsettle any engineering leader sitting behind a productivity dashboard. Eighty-nine percent of engineering leaders surveyed said their current metrics accurately reflect AI's impact on their teams. Ninety-four percent of those same leaders said that key factors like technical debt accumulation, validation time, and developer burnout are missing from those metrics. Both numbers came from the same survey. Both are probably true.

That gap is worth sitting with. Leaders believe their dashboards are accurate. Leaders also know those dashboards are missing the things that matter most. The cognitive move required to hold both beliefs simultaneously is not cynicism. It is something more mundane: we trust the data we have because the alternative is admitting we are making multi-year investment decisions with incomplete information.

## The Shift That Metrics Did Not Track

When AI coding tools crossed from useful to essential over the last two years, the nature of engineering work changed structurally. Code generation became fast and cheap. What did not become fast and cheap was understanding whether the generated code was right.

The Harness survey found that 81% of engineering leaders report developers now spend more time reviewing AI-generated code than they did generating code before AI. Nearly a third of the average engineering day, approximately 31%, is now consumed by what the report calls invisible work: reviewing AI-generated code for correctness, fixing subtle bugs that look right until they fail, explaining what agents built to the teammates who have to maintain it, and context-switching between threads that are all moving simultaneously. None of this shows up in velocity metrics, deployment frequency, or cycle time.

This is the invisible work problem. It is not that developers are less productive. It is that a large and growing fraction of what they do does not appear in the frameworks used to make decisions about teams, headcount, and investment. Organizations are sitting on a measurement blind spot and mistaking it for a view.

## The Productivity Paradox in Practice

The practical consequence shows up in a pattern that engineering leaders are starting to recognize. Throughput metrics improve, sometimes significantly, in the months following AI tool adoption. Incident rates also rise. Code review turnaround slows. Developer satisfaction surveys start trending downward around six months in. And leadership, reading the throughput numbers, concludes that adoption is succeeding.

A Stack Overflow survey published this week captures a related dynamic. Eighty-four percent of developers now use AI tools. Only 29% trust the accuracy of what those tools produce. The gap between adoption and trust is exactly the invisible work made visible in a different form: developers are shipping code they do not fully believe in, because the review process designed to close that trust gap is under strain from the volume it is being asked to absorb.

Smartsheet's research adds another layer. Automation intensity for their enterprise users has grown 55% year-over-year. Overall activity is up 46%. The workday has not grown. It has simply gotten denser. The same hours now contain more decisions, more context switches, more code to evaluate, and more consequences riding on each approval. That intensification does not produce better output indefinitely. Decision fatigue is real, and it shows up in the reviews that happen at hour seven of a dense day, when vigilance decrement makes a subtle bug look like a safe merge.

## What Good Measurement Actually Looks Like

The Harness report argues that what is missing is not better versions of existing metrics. It is a new measurement category entirely, one that tracks the unit of work that AI has actually created.

The old unit of work was code produced. Engineers wrote functions, reviewers approved them, and velocity was measured in features delivered per sprint. The new unit of work is judgment applied. The output that matters is not the code the agent generated. It is the human decision about whether that code is correct, appropriate, safe to ship, and legible to the team that will maintain it. That decision is invisible to every productivity dashboard currently in use.

Practically, this means tracking things most teams do not track: validation time per pull request, AI code acceptance rates broken out by domain and complexity, cognitive load proxies like review queue depth and time-to-first-comment, and burnout signals from developer surveys that specifically ask about review burden rather than just general satisfaction. It also means treating AI performance as its own observable system with its own metrics: agent accuracy rates, token costs per task completed, and the delta between AI-generated first drafts and what actually gets merged.

None of this is exotic. Most of these signals exist in the tools teams already use. The gap is that nobody is looking at them as a coherent picture, or using them to inform the same decisions where velocity and DORA currently dominate.

## The Organizational Blind Spot Is a Leadership Problem

The most important thing the measurement gap reveals is not an engineering process problem. It is a leadership information problem. Engineering leaders are being asked to make resourcing decisions, capability assessments, and AI investment calls using data that was designed for a world where agents did not exist. The result is that organizations which believe they are measuring success are actually measuring the easy parts and assuming the rest.

The 6% figure from the Harness report is worth highlighting separately. Only 6% of surveyed engineering leaders believe their existing measurement frameworks can adapt to what AI has changed about engineering work. That is not a number that suggests the problem is being underestimated. It is a number that suggests leaders understand the gap and have not yet found a path to closing it.

Closing it starts with separating two things that are currently blurred together. Measuring engineering performance against individual AI usage is a motivation problem masquerading as a measurement problem. More than half of developers surveyed fear that AI metrics will be used to evaluate them individually. That fear shapes behavior in ways that make adoption worse, not better. The productive measurement frame is organizational rather than individual: what is the team's validation capacity relative to its generation capacity, and is that ratio improving or degrading over time.

## The Question Worth Asking First

Before adopting any new framework or adding any new dashboard, there is a simpler question worth asking: if you removed velocity metrics entirely from next quarter's planning conversation, what would you not know that you need to know?

That exercise tends to surface the invisible work quickly. Teams that have done it often discover that the things they would miss most are not in their dashboards at all. They are in the informal signals that experienced engineers carry: the sense that review quality is slipping, the feeling that the team is shipping faster but understanding the codebase less, the growing reluctance to touch certain areas because nobody is quite sure what the agent did there and the original author was the agent.

Those signals are real data. Making them visible is not primarily a tooling problem. It is a decision about what counts as information worth tracking. In a measurement environment still calibrated to 2023, making that decision deliberately is one of the more consequential things an engineering leader can do right now. The teams that will compound fastest are not the ones generating the most code. They are the ones who have figured out what to measure after the code is generated, and built the feedback loops to act on what they find.
