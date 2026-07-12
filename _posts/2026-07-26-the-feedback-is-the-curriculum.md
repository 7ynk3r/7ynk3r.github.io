---
layout: post
title: "The Feedback Is the Curriculum"
date: 2026-07-26
description: "Every correction you make to an agent, every PR comment you write, every tracked change in a document review is a lesson. The trick is to stop letting those lessons evaporate."
---

Every time you correct an agent, something valuable is produced. You tell it the output format was wrong, the naming convention doesn't match your codebase, the tone was too formal for an internal memo. The agent adjusts. The task gets done. The conversation ends.

Then the next conversation starts, and you explain the same things again.

This is the most common failure mode in working with agents, and it is almost entirely avoidable. The corrections you made were not just fixes. They were training data. Specifically, they were the highest-quality training data possible for your use case, because they came directly from the gap between what the agent produced and what you actually wanted. That gap is information. Most people discard it.

## Corrections Are Gradient Signals

There is a framework from AI research called Reflexion. The core idea is that instead of updating a model's weights after a failure, you convert the failure into natural language: "I tried X and it did not work because Y. Next time I should do Z." That verbal summary gets stored and injected into the next attempt. The model improves without retraining.

This is precisely what happens when you correct an agent in conversation, except you are doing it implicitly and throwing the result away. The correction you typed exists only as a response in a closed chat window. It does not survive to the next session, the next colleague, the next time the agent needs to do something similar.

The question is not whether your corrections contain useful information. They obviously do. The question is whether you have a system for capturing them.

## Three Sources You Are Already Sitting On

The most direct source is agent conversation history. When you review a completed conversation and notice what you had to fix, you are reading a list of the agent's blind spots relative to your specific context. Not the model's general limitations, but the specific delta between its defaults and your preferences. Those corrections, when read together, form a remarkably precise description of what you want.

The second source is pull request reviews. Code review comments are among the densest concentrations of engineering standards that exist. When a senior engineer writes "we do not use global state here" or "this belongs in the service layer, not the controller," they are articulating a rule that applies not just to that line of code but to an entire class of future decisions. Most of that knowledge lives in closed pull requests, seen once by the author and then archived. Tools like PR-Distiller and braindump have made exactly this observation, building pipelines that crawl PR comment histories, filter out the noise, and distill the recurring patterns into instruction files that agents can actually use.

The third source is document reviews: PRDs, RFCs, architecture documents, anything that went through a comment and revision cycle. The tracked changes in a reviewed document reveal something the original did not: the gap between what the author thought was clear and what the reader actually needed. When a product reviewer rewrites a requirements section, they are encoding a mental model of what good requirements look like. That encoding is almost never extracted. It stays in the document's revision history, visible to no one.

## The Reflection Step

The practical move is to treat review as a production process, not just a quality gate.

After a substantive agent conversation, especially one where you made several corrections, take five minutes and ask the agent to reflect on what it learned. Not in the next message of the same conversation, but as a deliberate meta-task: review this transcript and generate the standing instructions that would have prevented the mistakes. What you get back is a draft skill file. It will not be perfect, but it will be close, and it will be faster to edit than to write from scratch.

The same process applies to PR reviews. After a review cycle closes, ask an agent to read the comment thread and extract the generalizable rules. Not the specific changes, but the principles behind them. "We replaced this implementation because of performance constraints at scale" becomes a rule about when to prefer a different data structure. "The error handling here doesn't match our observability conventions" becomes a rule about how errors should be surfaced. Each comment is a lesson. The agent can do the extraction; you just have to run the process.

For document reviews, the richest moment is right after comments are resolved. The editor who wrote the comments has a model of what the document should look like. Running a reflection pass while that model is still encoded in the comment thread produces something that a pass six months later cannot.

## What You Are Actually Building

The output of this process is not just better context for future conversations. It is an accumulating record of your actual standards, derived from your actual decisions, in a form that agents can use directly.

The skills file you generate from a PR review is not a generic coding style guide. It is the specific rules that your team enforced on your codebase over a period of months. It contains the real constraints, not the aspirational ones in the wiki nobody reads. An agent working with that context is not working from a model trained on the internet's average codebase. It is working from your codebase's history.

Research into agent learning frameworks has converged on this insight from a different angle. The most durable knowledge is not injected through better prompts; it is accumulated through episodic memory: the record of what worked, what failed, and what the agent was told to do differently. The difference is whether that accumulation is intentional or accidental.

Every review you conduct is generating episodic memory. Right now, most of it is going into a database no one queries. The reflection step is just the decision to query it.

## The Leverage Point

The previous post in this series argued that every agent task is a primitive, and primitives compound. This is the mechanism by which that compounding happens faster.

Teaching an agent from scratch requires deliberate effort. Teaching it from a review transcript requires almost none; the work was already done during the review itself. The cost of generating the skill file is almost zero relative to the cost of the review that produced the raw material. What changes is just whether you treat the review as an endpoint or as a source.

The corrections you have already made, across every conversation and review cycle in the past year, contain a precise description of how you work and what you want. Some of it is sitting in closed pull requests. Some of it is in comment threads on documents that shipped months ago. Some of it is in conversation histories that have already been pruned.

The ones that are still accessible are worth recovering. Not because the individual corrections matter, but because the pattern across them is the closest thing to a curriculum that an agent could have for working with you specifically.

You wrote it already. You just did not keep it.
