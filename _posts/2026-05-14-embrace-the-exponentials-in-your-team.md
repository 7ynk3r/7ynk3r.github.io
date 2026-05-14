---
layout: post
title: "Embrace the Exponentials in Your Team"
date: 2026-05-14
description: "Some engineers on your team are already operating on a different curve. The leadership challenge is not slowing them down to the mean, but designing around their leverage."
---

Three months ago, an engineer on a team I was advising started closing issues at a pace that made the rest of the sprint board look like background noise. Not slightly faster, qualitatively different. PRs that used to take a week were landing in a day. Problems that required two or three back-and-forth review cycles were arriving with the edge cases already handled, the tests already written, the migration path already sketched. The other engineers on the team were solid, experienced, and working hard. The gap had nothing to do with effort.

The manager's first instinct was to wonder if something was wrong. Maybe the work was shallow. Maybe corners were being cut. Maybe the velocity numbers were being gamed somehow. After digging in, none of that was true. The engineer had crossed a threshold that most of the team had not crossed yet: they were operating with AI as a genuine amplifier rather than an occasional assistant, and the compounding had kicked in.

That manager's second instinct was to distribute the engineer's work differently, slow the review process to keep pace with the rest of the team, and add more documentation requirements. All of that would have been a mistake.

## Two Curves Are Now Running in Parallel

Every engineering team of meaningful size now contains people operating on fundamentally different productivity curves. One group is iterating linearly, making steady, respectable progress through the same general workflow they have used for years. The other group has crossed some inflection point where their tools, their habits, and their judgment compound together in a way that linear scaling cannot describe.

The gap is not a matter of raw intelligence or years of experience. I have seen junior engineers cross the threshold before seniors who are technically more accomplished. What distinguishes the exponential operators is not what they know but how they work: they have rebuilt their workflow around AI-first exploration, they iterate in tight loops, they treat code generation as cheap and judgment as expensive, and they have developed the taste to know when output is good enough to ship and when it needs another pass. They have internalized what I wrote about earlier this year: [the specification is now the real source code](/2026/01/19/specifications-are-becoming-the-real-source-code/), and the hard work happens before the implementation begins.

The critical point for leaders is that the gap between these two curves is not closing. It is widening. Every month that passes without crossing the threshold is a month of compounding advantage lost.

## What Embracing Actually Requires

Most organizations respond to their exponential operators the same way that manager initially did: by averaging them back to the mean. The instinct is understandable. A team full of people moving at different speeds creates coordination overhead. Standard processes exist for good reasons. Consistency matters for review quality and knowledge transfer.

But the averaging instinct destroys the thing worth preserving. When you slow an exponential operator to match team velocity, you are not making the team more cohesive. You are dismantling the most valuable feedback loop your team has access to: a live demonstration that a different way of working is possible.

Embracing the exponentials starts with resisting that averaging impulse. It means accepting that your team now contains people who should operate under different constraints, not because they have earned special treatment, but because the standard constraints were designed for a different kind of workflow and will actively damage theirs.

Concretely, this means giving exponential operators wide scope rather than narrow tickets. It means measuring their contribution at a level of abstraction that the standard sprint metrics cannot capture. Story points designed for linear estimation will always make exponential output look like cheating. The right question is not whether someone's velocity number looks reasonable. The right question is whether their work is coherent, well-reasoned, and extending the capabilities of the system in the right direction.

## The Measurement Trap

Standard engineering metrics were built for a world where implementation capacity was the bottleneck. PR count, lines reviewed, tickets closed per sprint, on-call response time: all of these measure throughput of a specific kind. They made sense when the constraint was developer time applied to discrete tasks.

That constraint has shifted. For exponential operators, implementation is no longer the bottleneck. Judgment is. They can produce more implementation than the team can safely review or deploy. Their actual scarce resource is the clarity of their thinking about what to build and why.

Measuring them on throughput metrics will produce bad outcomes in one of two directions. Either you will optimize their throughput and they will generate more output than the system can absorb, which creates a different kind of chaos. Or you will interpret their high throughput as suspicious and apply friction to slow it down, which eliminates the value.

The better frame is leverage. How many other engineers does this person make more effective? How much complexity does their architectural judgment prevent? How much rework does their code review catch before it becomes technical debt? These things are harder to quantify but they are the actual product of an exponential operator working well.

## Designing Around Leverage

The org design question follows from the measurement question. If the value of an exponential operator is leverage rather than throughput, then the role structure should maximize leverage rather than treat them as a high-output individual contributor.

This looks different in practice than it sounds in theory. It does not mean making everyone a staff engineer with vague strategic responsibilities. It means pairing exponential operators with teams or problems where their working style will propagate. It means making them the first person to touch a new area so they can establish patterns that others can then follow. It means giving them permission to refactor processes, not just code, when they identify something that is slowing the team's ability to compound.

Airtable divided their engineering teams into fast-thinking units for rapid iteration and slow-thinking units for infrastructure and long-term durability. Affirm paused normal engineering for a week to rebuild the workflow of over eight hundred engineers around agentic development. These are organizations that recognized the exponential curve was real and restructured around it rather than waiting for a gradual cultural shift. The teams that are dragging their feet on this restructuring are building a gap that will be very expensive to close later.

## The Hardest Part Is Psychological

Leaders who built their careers on deep linear mastery of a technical domain have a genuine adaptation challenge here. When someone on your team is operating in a way you do not fully understand, at a velocity that makes your own historical output look modest, the natural response is some combination of skepticism and defensiveness. That response is worth examining carefully, because it is exactly the response that prevents you from learning what the exponential operator is doing and why it works.

The most useful thing a leader can do with an exponential operator is study them. Not manage them or constrain them, but watch the loop they are running, understand what judgment calls they are making, and ask how the rest of the team can get closer to that approach. The gap in productivity curves is not a fixed property of individuals. It is a gap in methods. Methods can spread.

The teams that compound the fastest are the ones where the exponentials are visible, respected, and structurally positioned to pull others up the curve. That does not happen by accident. It happens because someone in leadership decided to stop treating the exponentials as outliers to be managed and started treating them as the signal worth following.

The curve is not going back to linear. The only meaningful question is where your team sits on it, and whether you are designing to move up or to stay put.
