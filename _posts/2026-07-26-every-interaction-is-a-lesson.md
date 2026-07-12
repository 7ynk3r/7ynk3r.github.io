---
layout: post
title: "Every Interaction Is a Lesson"
date: 2026-07-26
description: "Anywhere a human gave input to push an output closer to what they actually wanted, that interaction contains a precise description of their standards. The trick is to stop letting it evaporate."
---

Every time you correct an agent, something valuable is produced. You tell it the output format was wrong, the naming convention doesn't match your codebase, the tone was too formal for an internal memo. The agent adjusts. The task gets done. The conversation ends.

Then the next conversation starts, and you explain the same things again.

This is the most common failure mode in working with agents, and it is almost entirely avoidable. The corrections you made were not just fixes. They were training data. Specifically, they were the highest-quality training data possible for your use case, because they came directly from the gap between what the agent produced and what you actually wanted. That gap is information. Most people discard it.

And the problem is not limited to agent conversations. Any time a human has given input to push an output closer to what they actually wanted, the same thing is true. A code review comment. A tracked change in a document. A manager's rewrite of a proposal. A designer's markup on a mockup. A customer's annotation on a prototype. The medium varies. The structure is always the same: something was produced, a human judged it against their actual standard, and they left a record of the gap. That record is a lesson. Almost no one treats it as one.

## Corrections Are Gradient Signals

There is a framework from AI research called Reflexion. The core idea is that instead of updating a model's weights after a failure, you convert the failure into natural language: "I tried X and it did not work because Y. Next time I should do Z." That verbal summary gets stored and injected into the next attempt. The model improves without retraining.

This is precisely what happens every time a human corrects any output, except most of us are doing it implicitly and throwing the result away. The correction exists only as a mark in a closed review, a message in a conversation that ended, a diff that got merged and forgotten. It does not survive to the next session, the next colleague, the next time someone needs to produce something similar.

The question is not whether those corrections contain useful information. They obviously do. The question is whether you have a system for capturing them.

## The Signal Is Everywhere You Left Feedback

The pattern is not specific to agents or to code. It applies to any artifact that went through a human review loop, in any domain.

Agent conversation histories are the most direct case. When you review a completed session and notice what you had to fix, you are reading a list of the model's blind spots relative to your specific context. Not general limitations, but the precise delta between its defaults and your preferences. Those corrections, when read together, form a description of what you want that is far more accurate than anything you would write from scratch, because it was produced under the pressure of an actual task.

Code reviews carry the same signal. When a senior engineer writes "we do not use global state here" or "this belongs in the service layer, not the controller," they are articulating a rule that applies not just to that line of code but to an entire class of future decisions. That knowledge lives in closed pull requests, seen once by the author and then archived. Tools like PR-Distiller and braindump have built exactly this observation into pipelines that crawl comment histories, filter out the noise, and distill the recurring patterns into instruction files that agents can actually use.

Document reviews carry it too: PRDs, RFCs, strategy memos, architecture proposals, anything that went through a comment and revision cycle. The tracked changes reveal something the original did not, which is the gap between what the author thought was clear and what the reader actually needed. When a product lead rewrites a requirements section, they are encoding a mental model of what good requirements look like. That encoding almost never gets extracted.

But the class is larger than any of these examples. A designer's annotations on a mockup encode a visual standard. A legal team's redlines on a contract encode an acceptable risk threshold. A manager's reply-all on a proposal encodes a strategic priority. An editor's margin notes on a first draft encode a voice. A customer's inline comments on a shared doc encode an unmet expectation. Any place where a human looked at something, judged it against their actual standard, and left a record of the gap is a source. The common structure is: an output existed, a human cared enough to correct it, and the correction encoded something real about what they wanted.

## The Reflection Step

The practical move is to treat review as a production process, not just a quality gate.

After any substantive review cycle, whether it is a conversation, a code review, a document, or anything else, take the feedback that was produced and run a reflection pass on it. Not to relitigate what was corrected, but to ask: what is the generalizable rule that would prevent this correction from being necessary next time? That is the question an agent is well-suited to answer, given the raw material.

After a conversation where you made several corrections, the meta-task is simple: give an agent the transcript and ask it to generate the standing instructions that would have prevented the mistakes. What you get back is a draft skill file. It will not be perfect, but it will be faster to edit than to write from scratch, and it will be grounded in what actually happened rather than what you imagine you want.

The same process applies to any review artifact. After a code review closes, ask an agent to read the comment thread and extract the principles behind the corrections, not the specific changes. "We replaced this implementation because of performance constraints at scale" becomes a rule about data structure selection. "The error handling here doesn't match our observability conventions" becomes a rule about how failures should surface. After a document review, the richest moment is right after comments are resolved, when the reviewer's model of what the document should look like is still fully encoded in the thread. A reflection pass at that moment produces something that a pass six months later cannot.

The reflection step works on anything with the right structure: a human saw an output, wanted something different, and said so. The medium is irrelevant.

## What You Are Actually Building

The output of this process is not just better context for future conversations. It is an accumulating record of your actual standards, derived from your actual decisions, in a form that agents can use directly.

The instructions you generate from a code review are not a generic style guide. They are the specific rules your team enforced on your actual work over a period of months. They contain the real constraints, not the aspirational ones in the wiki nobody reads. The instructions you generate from a design review are not a generic UX checklist. They are the specific judgments your designer applied to your actual product under actual conditions. An agent working with that context is not working from a model trained on the internet's average standards. It is working from your history.

Research into agent learning frameworks has converged on this insight from a different angle. The most durable knowledge is not injected through better prompts; it is accumulated through episodic memory, the record of what worked, what failed, and what the agent was told to do differently. The difference is whether that accumulation is intentional or accidental.

Every review generates episodic memory. Right now, most of it is going into a system no one queries. The reflection step is just the decision to query it.

## The Leverage Point

The [previous post in this series]({% post_url 2026-07-19-do-everything-with-an-agent %}) argued that every agent task is a primitive, and primitives compound. This is the mechanism by which that compounding happens faster.

Teaching an agent from scratch requires deliberate effort. Teaching it from a review that already happened requires almost none; the work was done during the review itself. The cost of the reflection pass is nearly zero relative to the cost of the review that produced the raw material. What changes is just whether you treat the review as an endpoint or as a source.

The corrections you have already made, across every review cycle in the past year, contain a precise description of how you and your team work and what you actually want. Some of it is in closed pull requests. Some of it is in comment threads on documents that shipped months ago. Some of it is in conversation histories that have already been pruned. Some of it is in design files, contract redlines, customer feedback threads, and anywhere else people have been doing the work of pushing outputs toward standards.

The ones that are still accessible are worth recovering. Not because the individual corrections matter, but because the pattern across them is the closest thing to a curriculum that an agent could have for working in your specific context.

You wrote it already. You just need to keep it.
