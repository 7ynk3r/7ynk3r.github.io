---
layout: post
title: "Do Everything with an Agent"
date: 2026-07-12
description: "Every task you delegate to an agent is a primitive. Primitives combine. The real value is not the task you just completed, it is the capability you just added to every future workflow."
---

A friend of mine was watching someone ask an agent to generate a PDF. He was amused. "Why are people spending tokens on that? You can run a terminal command in two seconds." He was right about the math. He was wrong about the point.

The PDF is not the point.

## The Task Is Not the Investment

When you delegate a task to an agent, two things happen. The obvious thing is that the task gets done. The less obvious thing is that the agent now has a demonstrated understanding of how you want that task done: the output format, the file naming conventions, where things go, what quality looks like. That understanding does not reset when the conversation ends, at least not if you have built your agent setup with any intention. Skill files, project context, persistent instructions: these are the mechanisms that turn a one-off execution into a reusable capability.

This is the distinction that the token-cost objection misses. Running a terminal command to generate a PDF gets you a PDF. Delegating the task to an agent and refining the output until it meets your standard gets you a PDF plus a documented workflow that the agent can reproduce reliably, combine with other workflows, and deploy as part of something larger.

The terminal command does not compound. The agent invocation does.

## How Primitives Combine

Think about what it actually means to teach an agent something. You describe how you want a PDF formatted: margins, font choices, how tables should render, what the header should contain. The agent does it. You correct what is wrong. The agent updates its understanding. After a few iterations, it can generate that PDF without guidance. The capability exists as a primitive: a discrete, reliable unit of work the agent can perform.

Now teach the agent something different. Teach it how to pull a sales report: which database, which query, how to calculate the metrics you care about, which time windows to use, how to handle edge cases when data is missing. Another primitive. Another reliable unit of work.

Neither primitive is impressive in isolation. But the moment both exist, something new becomes possible. "Generate a PDF of this week's sales report" is now a single instruction. The agent does not need you to explain the PDF format. It does not need you to explain the reporting logic. It combines what it already knows and produces the output. You did not build an integration, write any glue code, or wire up a cron job. You just asked.

This is the compound effect that the token cost misses entirely. The cost of generating that PDF the first time was not just the cost of a PDF. It was an investment in a primitive. And the returns on a primitive are not the single task it enables; they are every task that task will eventually combine with.

## The Objection Is About the Wrong Time Horizon

There is a version of the token-cost argument that is worth taking seriously. For a genuinely isolated task with no future relevance, no compounding, and no context that transfers, delegating to an agent when a simpler tool would do is waste. The objection is correct in those narrow cases.

But the cases are much narrower than the argument assumes. The people making fun of agent-generated PDFs are treating every task as isolated. They are evaluating the cost of the individual invocation without accounting for what the invocation is building. That is like complaining about the cost of writing a function when you could have copied and pasted the code. Technically cheaper right now. Structurally worse in every direction that matters.

The question to ask about any task is not "is this the most efficient way to execute this specific step." It is "is this building toward something." If the answer is yes, the token cost is not a cost. It is a capital expenditure on a capability you will use again, at less cost, in more complex contexts.

## The Complexity Ceiling Rises

What changes when primitives accumulate is not just speed. It is the complexity of what becomes delegatable.

With no primitives, you can ask an agent to do things it already understands from training. Write a function, summarize a document, translate a sentence. Useful, but limited to what the model knows out of the box. With a library of primitives built from your actual context, your actual systems, your actual preferences, the frontier of what becomes a single instruction expands continuously.

You get from "generate a PDF" to "prepare the board presentation with this week's numbers, flag any metrics that are off-trend, and send it to the exec team." Not because someone built a product for that workflow, but because you trained an agent on each piece of it, and the pieces combine. The compounding is not metaphorical. It is structural.

Research into multi-agent systems has formalized this intuition. Agents that accumulate skills and can hand them off to other agents, or invoke them as sub-tasks, scale logarithmically on task complexity while static agents scale linearly. Every new skill a skill-equipped agent adds to its library is immediately available for composition with every other skill it knows. The library does not just grow, it multiplies.

## The Frontier Is Clarity, Not Code

The practical implication is direct: the limit on how far this compounds is not the agent's capability. It is the precision of your descriptions. Vague delegations produce workflows that almost work. Precise delegations, refined through correction until the output is exactly right, produce primitives that hold under composition. The investment is in the refinement, and the return is in everything that primitive eventually touches.

This is the same reason engineers write tested, documented functions rather than copying logic inline. Not because it is faster today, but because it is an asset. Because it handles the next case for free. Because it can be composed with something else without rework.

Every task you delegate to an agent and refine until it is right is a function in that library. The PDF your friend was laughing about is a function. The sales report is a function. The board presentation that combines twelve of those functions and produces something genuinely complex from a single instruction is what that library makes possible.

The person who asked the agent to generate the PDF was not wasting tokens. They were writing infrastructure.
