---
layout: post
title: "Why Gradual AI Adoption Fails and What to Do Instead"
date: 2026-05-09
description: "Engineering leaders keep treating AI adoption as a slow cultural change. The teams making real progress did something more disruptive: they stopped and retooled."
---

Most engineering organizations adopt AI the same way they adopt any new tool: gradually, voluntarily, and with a heavy emphasis on not disrupting current delivery. A few engineers get access to Copilot or Claude Code. Internal champions share tips in a Slack channel. Managers watch utilization dashboards and express cautious optimism in all-hands meetings. Six months later, fifteen percent of engineers are meaningfully using AI, seventy percent have tried it a few times, and fifteen percent have concluded it is mostly hype and stopped bothering.

The teams making real progress did something different. They stopped.

## The Affirm Experiment

In February 2026, Affirm paused normal engineering delivery for an entire week. Over eight hundred engineers—across functions, levels, and roles—were required to complete full agentic workflows from task specification through code review. Not as an optional hackathon. Not as a self-paced training module. As the job, for a week, company-wide.

The results were not subtle. Within weeks, more than sixty percent of pull requests were agent-assisted. The capability gap between early adopters and the rest of the organization—which had been growing for months under the gradual approach—effectively collapsed. Engineers who had been skeptical came out of the week with concrete evidence that the tools worked, opinions formed through their own hands, not through marketing material or peer advocacy.

Affirm was not alone. Several companies ran variations of the same pattern: dedicated time, mandatory participation, real work rather than toy exercises. The structure forced through the activation energy that gradual adoption could never accumulate.

## Why Gradual Fails

Voluntary adoption fails for structural reasons, not motivational ones.

The first problem is optimization pressure. Engineers on teams with delivery commitments face a daily choice: use a familiar workflow and ship on time, or experiment with AI tools and risk the sprint. Most engineers correctly choose the sprint. Not because they are resistant to change, but because the incentive system punishes experimentation during normal work. Gradual adoption asks individuals to absorb the learning cost personally while the team's velocity remains a shared expectation.

The second problem is the network effect of skill. AI tool effectiveness compounds with practice. An engineer who has used Claude Code across twenty tasks develops intuitions about prompt structure, context management, and when to step in versus when to let the agent run. An engineer who has used it three times has barely started building those intuitions. When a team's distribution is bimodal—a few power users and many novices—knowledge transfer is slow and often reduces to cargo-culting the expert's workflow without understanding why it works.

The third problem is social permission. In most engineering organizations, using AI aggressively is still mildly transgressive. There is an unspoken concern that relying on AI tools signals that you cannot do the work yourself. Early adopters are sometimes treated as shortcuts-takers rather than efficiency experts. Gradual adoption reinforces this framing by keeping AI use individual and optional. Mandatory, coordinated adoption resets the frame: this is how we work now, and the question is how to work better, not whether to engage at all.

## What the Retooling Week Actually Does

The structured pause is not primarily a training exercise. Training could be done asynchronously, in the background. The pause accomplishes something different: it creates a common reference experience.

After a shared week of intensive AI-assisted work, a team has a shared vocabulary for talking about what works. They have collectively discovered the failure modes—the AI that confidently produces wrong code, the context window limitations, the tasks where the tool adds more overhead than value. They have also collectively discovered the capabilities that surprised them. These shared discoveries become the foundation for team norms around AI use, which is what persistent adoption actually requires.

Engineering managers who ran these exercises consistently reported the same thing: skeptics were converted not by argument but by evidence they generated themselves. An engineer who has personally debugged the output of a coding agent and concluded that they can trust it for a certain class of task is not going to become skeptical again. Their new position is grounded in experience rather than ideology.

## What Leaders Get Wrong in the Design

The most common mistake in structuring an AI adoption push is using synthetic tasks. Hack weeks where engineers build demos, internal tools, or prototypes are enjoyable and occasionally produce useful artifacts, but they do not change how people work on their actual product. The learning does not transfer because the context does not transfer.

The second common mistake is making it optional within the organization. Even a mandatory week becomes effectively optional when some teams participate seriously and others treat it as a forced vacation. The value comes from the shared experience. If participation is uneven, the social permission problem remains: the team never normalizes AI-assisted work because the team never collectively did AI-assisted work.

The third mistake is not following through on the infrastructure. A week of intensive AI use will surface specific friction points: a codebase that is too messy for agents to navigate effectively, authorization workflows that add fifteen minutes to every agent task, a lack of observability into what agents are doing. Leaders who run the retooling week as an event and then return to normal without addressing these friction points find that adoption regresses over the following months as the initial momentum dissipates.

## The Actual Ask

What Affirm did requires a meaningful commitment from leadership. Pausing delivery for a week is not trivial. It requires stakeholder management, honest communication about why the pause is worth the short-term cost, and a genuine belief that the capability gap will compound into a competitive disadvantage if it is not addressed now.

That belief is increasingly well-supported by evidence. Teams that have crossed the threshold where AI-assisted development is the default—not the exception—describe qualitatively different delivery dynamics. Tasks that used to take days take hours. The limiting factor shifts from implementation bandwidth to architectural judgment and evaluation quality. The engineers who master that shift are not replacing their skills; they are applying them at a different level.

The question for engineering leaders is not whether AI adoption matters. It is whether the current approach is building the capability fast enough. If the answer is no, the path forward is probably less gradual than you think.

A week is not a long time. The organizational velocity you gain in the following quarter will be.
