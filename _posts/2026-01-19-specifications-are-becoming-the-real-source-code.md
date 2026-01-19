---
layout: post
title: "Specifications Are Becoming the Real Source Code"
date: 2026-01-19
description: "Why clear intent and executable specs are moving to the center of software engineering."
---

Code is no longer the center of software. The center is a shared, precise
description of intent.

I have felt this shift in my own work. I am spending more time on RFCs or PRDs
than in PRs, because the decisions that matter happen before the code exists.
If we do that work well, the implementation becomes the easiest part.

## Code is a small slice of the value

Code is a small slice of a developer's value. The rest is distilling stories,
planning, and verifying intent. That is the invisible work that makes software
reliable and makes teams move.

Think about any real project. You spend time translating a vague request into a
clear problem. You negotiate scope. You write down edge cases so the team can
agree on what "done" means. You draft a plan so another engineer can review the
approach before a line is written. You add tests so future changes do not break
the behavior you intended. That is all communication.

These artifacts are how you create alignment across roles. A product manager can
read the spec and confirm the story. A designer can verify the experience. A
security reviewer can check the policy. Code alone hides those conversations and
makes intent easy to misunderstand.

When we pretend code is the only artifact, we hide the most important part of
the job. You can ship a brilliant implementation that solves the wrong problem.
You can also ship the right feature with the wrong behavior because intent was
never clear enough to check.

## Specifications are the true source

I see code as a lossy projection of intent. Meaning gets dropped the moment an
idea becomes syntax. You can read the code and still miss the policy, the
tradeoffs, or the "why" behind the decision.

Specifications aim to preserve that meaning. They describe what the system
should do and why, in language that can be reviewed, debated, and improved. If
the spec is the source, then code becomes one of many outputs. From the same
spec you can generate implementation, documentation, onboarding guides, and
even a plain language explanation or a podcast for users.

This is not about writing more documents. It is about choosing the artifact that
best captures intent and can be reused. A good spec survives refactors,
framework changes, and language migrations, while code does not. The spec is the
stable contract that everything else compiles against.

When specs are central, collaboration changes. Reviews focus on the spec first,
and code review becomes a check against it. That flips the flow from "implement
then explain" to "agree then implement," which reduces rework and makes feedback
faster for everyone involved.

## The Model Spec shows the idea in practice

One of the most powerful patterns I have seen is a shared model spec: a simple,
versioned set of Markdown files that define values and behavior. It makes
expectations explicit and creates a single reference point for a whole team.

The important part is that it is plain text. It is readable by humans,
reviewable by a team, and unambiguous enough to drive consistent behavior. That
is what it means to treat a specification as the primary artifact. It becomes a
shared reference point for engineers, researchers, reviewers, and leaders.

## When specs become executable

The bigger move is making specs executable. When a spec can be used to grade
outputs, it stops being a document and starts becoming a system. You can teach a
model or a service the policy directly, rather than repeating it at runtime.

In plain terms, the spec does not just sit on a shelf. It becomes a rulebook
that can be executed and enforced. That tightens the loop between intent and
behavior and reduces how often policy has to be restated at runtime.

## The future programmer is a human encoder

If this shift continues, the most valuable programmers are not the ones who can
translate ideas into perfect syntax. They are the ones who can translate fuzzy
intent into precise, unambiguous specifications.

That requires a different kind of craft. You need to define terms, set
boundaries, and state what must never happen. You need to think in examples and
counterexamples so the behavior is testable. You need to write so a model can
execute the intent and a teammate can challenge it without ambiguity.

This is a move from machine encoding to human encoding. The work is less about
arranging tokens in a file and more about shaping shared understanding across a
team. Code still matters, but it becomes the compiled artifact of a deeper
source.

The practical takeaway is simple: treat specifications as the source of truth
and you will ship clearer systems with less rework. The teams that master this
will move faster, not because they write more code, but because they waste less
intent.

What would change on your team if the spec, not the code, was the primary
artifact?
