---
layout: post
title: "The J-Curve Is Not a Waiting Game"
date: 2026-05-15
description: "The DORA 2026 report shows incidents rising sharply alongside AI-driven throughput gains. The dip is not turbulence to endure. It is a diagnostic about which systems in your organization need redesign."
---

The DORA 2026 ROI report lands on a finding that should unsettle any team celebrating throughput gains. While AI adoption is correlated with more code-related tasks per team, faster cycle times, and rising individual effectiveness scores, it is also correlated with a sharp increase in software delivery instability. Incidents per pull request are up 242 percent. Monthly incidents are up nearly 60 percent. The change failure rate in their model rises from 5 to 6 percent after adoption.

These numbers do not cancel the productivity gains. But they do describe an asymmetry that most organizations are not treating seriously enough. The system that generates work is running faster. The system that catches errors is not keeping pace.

## The J-Curve Is a Diagnostic, Not a Phase

DORA calls the period of initial productivity dip the J-Curve: a temporary regression before long-term gains. Most leaders who encounter this framework treat it as a forecast. Get through the dip, reach the gains. Move fast, absorb the cost, wait for the payoff.

That reading is wrong in an important way. The dip is not random turbulence. It is a stress signal about specific systems that were designed around assumptions that AI adoption has invalidated. The DORA team identifies three causes: the learning curve as teams adapt their workflows, the verification tax of reviewing AI-generated code, and the downstream strain on testing and change approval systems that were built for lower code volume.

Each of these causes has a source. The verification tax does not shrink on its own. It shrinks when review processes are redesigned for AI-assisted output patterns rather than assuming the code was written by the person submitting it. The pipeline strain does not ease by waiting. It eases when testing infrastructure, deployment gates, and observability tooling are rebuilt to handle the new volume and surface the error patterns that agents specifically tend to produce.

Organizations that treat the J-Curve as a phase to endure will not exit it cleanly. Organizations that treat it as a diagnostic will identify which systems are under stress and redesign them. The difference in outcome between those two approaches compounds quickly.

## Friction Moves. It Does Not Disappear.

The first thing to understand about AI-generated code and quality is that friction does not disappear when code generation gets faster. It relocates.

When engineers write code, understanding travels alongside it. The person who wrote the function understands it. The reviewer who read it carefully has built some model of it. The team that absorbed a discussion in a pull request thread has some exposure to what was decided and why. That distributed understanding is invisible until it is missing, and it is missing more often now.

When an agent generates code from a prompt, the output may be correct and even elegant, but the understanding that usually travels alongside handwritten code does not make the same journey automatically. The function exists. The reasoning that produced it is not embedded in the team's working memory the way it would be if an engineer had spent time writing it.

This is the verification tax in concrete form: reviewing code you did not write, at a volume two to three times what your review process was calibrated to handle, with less ambient context than you would normally bring to a peer's pull request. The work still exists. It is just arriving in a different form, and the systems designed for the old form are under pressure.

## The Organization Has Not Caught Up

The DORA findings on organizational readiness are arguably more diagnostic than the incident metrics. Of 219 organizations surveyed, evaluating AI-generated code had become the top hiring priority. Yet only 19 of those 219 had formally updated their role definitions to reflect that shift.

Individual engineers adopted agents. Organizations changed almost nothing structurally. Process, accountability structures, review standards, and incentives remained calibrated to a world where the engineer who wrote the code was also the person who best understood it. That assumption is no longer reliably true, and the systems built on it are generating the instability numbers the report describes.

This is the organizational lag. It is not malicious or unusual. Organizations update their structures on cycles measured in quarters or years. Individual behavior updates in weeks. The gap between those cycles is where technical and organizational debt accumulate together, and right now that gap is unusually large.

## What the Accountability Gap Actually Costs

When something breaks in a system where humans wrote the code, accountability is traceable enough to create feedback. The person who wrote the function, the reviewer who approved it, the engineer who shipped it: each played a visible role. The feedback loop is imperfect, but it exists. Engineers learn from failures in code they authored.

When an agent generated the code and a human approved it without fully understanding it, the accountability surface is blurrier. The incident exists. The feedback loop that would convert it into behavioral or process change is weaker. If the review process does not catch the pattern and update the constraints the agent operates under, the same class of error recurs. The incident becomes a tax on velocity rather than an input to improvement.

This is the structural gap that most organizations have not yet closed. They have agents generating code. They do not yet have systems that reliably convert agent-generated failures into improved agent behavior or improved human oversight.

## What Needs to Change First

The DORA report is careful to frame this as a foundation problem rather than a tooling problem. AI acts as an amplifier. Strong foundations produce amplified gains. Weak foundations produce amplified dysfunctions. The organizations exiting the J-Curve successfully share a structural characteristic: they redesigned the verification layer alongside the generation layer.

In practice, this means review processes that account for AI-output patterns rather than assuming human-authored code heuristics. It means test infrastructure that scales to handle the increased pull request volume without becoming a bottleneck that agents simply outrun. It means explicit human checkpoints at the specific decision points where agent judgment is least reliable; not everywhere, but at the high-risk junctions where failures are expensive. And it means role definitions that reflect the actual shift in what engineers do: not primarily authors of code, but accountable evaluators of correctness and fit for what they approve.

None of this is primarily a tooling gap. The tools exist or are being built. The constraint is organizational. Who is accountable for what, how that accountability creates learning, and whether the systems that reward and measure engineering work have caught up to the reality of how engineering work is now being done.

## The Metric That Actually Matters

Throughput metrics are real. The productivity gains from AI adoption are measurable and significant. But throughput is not the goal. Working software in production, that users trust and that teams can maintain and evolve, is the goal.

A team shipping twice as much code with three times as many incidents is not twice as effective. It may be moving faster toward a larger pile of production problems and a codebase that fewer people truly understand.

The DORA team puts it plainly: AI should be measured not by the code it writes but by the bottlenecks it clears. The bottleneck worth clearing next is probably not code generation. It is the organizational systems that have not yet adapted to the code generation that is already happening. Velocity without comprehension is just a faster way to accumulate surprises in production, and the J-Curve will keep collecting its tuition until those systems catch up.
