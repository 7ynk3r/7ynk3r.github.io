---
layout: post
title: "Reverse PRD: When the Spec Is Missing"
date: 2026-02-16
description: "Recover the source of truth from the product, enforce it like coverage, and keep different artifacts in sync."
---

In many products the PRD is missing or years out of date. The real behavior lives in the UI, the APIs, and the code. You want the spec to be the source of truth, but you do not have one. The answer is to reverse it: derive a PRD from what the product actually does, then treat that document as the contract. I call that a reverse PRD.

This follows from a simple idea: [the spec is the real source code](https://7ynk3r.github.io/2026/01/19/specifications-are-becoming-the-real-source-code/). If we believe that, then when the spec is missing we should recover it, not accept that "the code is the documentation." A reverse PRD is the artifact you get when you infer intent from behavior, socialize it with stakeholders, and lock it in as the reference for tests and refactors. The only thing that matters is the spec. Everything else should align to it.

There is no denying that at the end of the day "code is law": it is what runs. But not everyone can read it. Product, design, support, and many engineers think in behavior and intent, not in syntax. The PRD is the desired spec—the human-readable contract that says what the system does and why. Reverse PRD is how you get that contract when it was never written or has drifted out of view.

## Validation is where the time goes

A reverse PRD is a hypothesis. You build it by watching the product, reading the code, and talking to people who use or maintain it. You write down what you think the system does and why. That draft is not the source of truth until it has been validated.

Validation is where most of the effort should go. Stakeholders must confirm that the described behavior matches what they expect. You sample real flows, edge cases, and failure modes and check them against the document. You use tests as evidence: scenarios that pass today become the stated behavior in the spec. Without that loop, the reverse PRD is just an opinion. With it, the spec becomes the agreed contract that the team can rely on for understanding, testing, and change.

## Enforce sync like code coverage

Once you have a PRD, the biggest risk is drift. Code changes and the document is forgotten. The fix is to treat "spec in sync with code" as a hard gate, similar to code coverage.

Define rules that tie areas of the codebase to their artifacts. When someone changes code in an area covered by a PRD, the pipeline checks that the PRD was updated or explicitly acknowledged. If the spec is stale or the link is broken, the build fails. You do not merge without meeting the bar. That keeps the PRD from becoming a one-time deliverable and turns it into a living contract that the team is forced to maintain.

This is the same mindset as coverage thresholds. We do not accept "we will try to add tests later." We fail the build. The same discipline applied to specs prevents the reverse PRD from decaying the moment the next feature ships.

## Different areas, different artifacts

Not every part of the system needs a PRD. Product behavior is captured in a PRD. Design and architecture decisions belong in RFCs. API surface is captured in OpenAPI or another API spec. Each area has one or more canonical artifacts that describe intent and behavior.

The rule is: this slice of the codebase is covered by one or more artifacts. The enforcement layer checks that when code in that slice changes, the corresponding artifact or artifacts exist, are updated, and stay consistent. A given area might have a PRD for behavior, an RFC for the design, and an API spec for the surface—multiple artifacts for the same slice. Same principle: everything that matters is written down and kept in sync.

## Recovery, then living

Reverse PRD gets you to a spec when you did not have one. Enforcement and ownership keep it alive. Those are two phases. First you recover the contract from the product. Then you run the process that keeps the contract and the code aligned.

The literature has related ideas: reverse requirements engineering, Martin Fowler’s "From Black Box to Blueprint," and tools that extract documentation or specs from code. The twist here is to treat the recovered artifact explicitly as the PRD—the single source of truth for that area—and to back it with rules that fail the build when the spec falls behind. The spec is not a byproduct of the code. The code is the implementation of the spec. When the spec was lost, we reverse it. Once we have it, we enforce it.

## Start where it hurts

You do not need to reverse the whole product at once. Start with the area that causes the most confusion: the flow everyone is afraid to change, the module that only one person understands, or the surface that customers rely on and that has no written contract. Draft the reverse PRD for that slice. Validate it with the people who care. Then add the rule: changes here require an updated spec. Once that works, repeat for the next area. The goal is not a perfect document on day one. It is a habit where the spec is the source and the pipeline keeps it true.

What would change on your team if every area had a clear artifact and the pipeline refused to merge when that artifact was out of date?

← [Specifications Are Becoming the Real Source Code](/2026/01/19/specifications-are-becoming-the-real-source-code/)
