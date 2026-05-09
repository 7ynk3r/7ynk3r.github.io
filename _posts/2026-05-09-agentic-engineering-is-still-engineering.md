---
layout: post
title: "Agentic Engineering Is Still Engineering"
date: 2026-05-09
description: "Vibe coding raises the floor for what anyone can build, but preserving quality, security, and coherence at agent speed requires a different and harder discipline."
---

Andrej Karpathy draws a sharp line between two things that people often conflate. Vibe coding raises the floor: anyone can describe what they want and get working software. Agentic engineering raises the ceiling: serious teams use autonomous agents while still owning the quality bar. The first is democratizing. The second is a professional discipline, and getting the two confused is how you end up with a fast codebase nobody trusts.

The conflation is understandable. From the outside, both involve an engineer typing natural language and watching code appear. The outputs can look identical. But the internal process is completely different, and the compounding effects of that difference show up six months later when a system needs to be extended, debugged, or handed off.

## The Bug That Matters

Karpathy shared an example from MenuGen that illustrates where agentic workflows actually break. He had an agent implement the Stripe payments flow. The agent matched purchase credits to Google accounts using email addresses—a reasonable implementation, syntactically clean, tests passing. The problem is that the Stripe email and Google login email can differ. One is payment contact information. The other is account identity. They are different things and should be joined on a persistent user ID, not on an address field that users sometimes change or that third-party services sometimes fill in differently.

The agent produced plausible code. Plausible is not the same as correct. A human engineer with enough product context and security intuition would have caught the assumption before it became a production bug. Karpathy notes that this is not a failing of the agent—it is the expected behavior of a system that produces coherent local solutions without the global context to know which local solutions create system-level risks.

This is the gap that agentic engineering exists to close.

## The Context Window Is the Program

In Software 3.0, as Karpathy frames it, the context window is the lever. What enters the model's context—instructions, specs, architectural constraints, codebase conventions, security boundaries, examples, memory from prior sessions—determines what comes out. The model interprets that context and performs computation over it. If the context is shallow, the output is shallow. If the context is precise, the output tends to be precise.

This is why context engineering has become the most consequential new skill in software development. It is not prompt engineering, which is a sentence-level concern. Context engineering is a system-level concern: what information should an agent have at each step, in what form, with what constraints, and what information should it not have. Getting this right requires the same architectural thinking that good software design has always required—except the artifact you are designing is the information environment an agent operates within, not the class hierarchy or the data model.

Teams that treat context as an afterthought—paste the codebase into the agent and ask it to go—see the result: inconsistent style, violations of existing abstractions, security assumptions that contradict system-level policy, and implementations that work in isolation but break at integration. Teams that treat context as a first-class artifact write agent instructions the way they write interfaces: precisely, with invariants, with explicit constraints, and with the scope of authority clearly defined.

## Evaluation Is Not Optional

The other discipline that separates agentic engineering from vibe coding is evaluation design. When agents work autonomously across multiple files and multiple sessions, correctness cannot be assumed from visual inspection of a clean diff. You need automated checks that verify behavior against intent, and those checks need to be designed by humans who understand both the intended behavior and the class of errors agents commonly produce.

This is harder than it sounds because the obvious tests—unit tests that pass, no compiler errors, formatted consistently—are insufficient. The Stripe email bug passes unit tests. What it violates is a system invariant about identity that has to be encoded either in an integration test or in a constraint stated explicitly enough that an agent checking its own work can surface the violation before the code ships.

The teams making serious progress with agentic engineering have invested heavily in this layer. Not just testing, but eval pipelines that check generated code against architectural policies, security patterns, and behavioral invariants that no individual unit test would catch. Some of those evals are automated. Some are human review with a structured checklist informed by the known failure modes of the agents in use. Both are necessary. Neither is the part of the workflow that agents replace.

## What Stays Human

It is worth being precise about what remains human work in this paradigm, because the list is specific and important.

The decision about what to build—the product judgment, the prioritization, the understanding of user context—stays human. Agents can generate options, surface tradeoffs, and execute implementations, but the judgment about which direction matters most is irreducibly human. This is the argument I made in [Specs In, Code Out](/2026/02/22/specs-in-code-out/): the spec captures that judgment, and everything downstream of it can be compiled. The compilation is increasingly automatic. The judgment is not.

Security boundaries stay human. Not because agents are incapable of reasoning about security, but because security policy in a real system reflects organizational decisions, threat models, and compliance requirements that only exist in human context. An agent cannot be given access to all of those inputs simultaneously, and even if it could, the accountability for security decisions cannot be delegated to a system that produced that code stochastically.

Taste stays human. The decisions about what makes code maintainable, what abstraction is elegant versus merely clever, what interface a future engineer will understand without documentation—these require aesthetic judgment that accumulates through experience and that agents simulate imperfectly. This does not mean agents cannot produce good code. It means that good code requires review by someone with the taste to recognize the difference.

## The Ceiling Is High

None of this is an argument for caution or restraint in adopting agentic workflows. The productivity differential between engineers who master this discipline and those who do not is becoming extreme. Karpathy frames it as far beyond the old "10x engineer" concept. The leverage is real and compounding.

The argument is for taking the discipline seriously. Agentic engineering is still engineering. It requires specs that encode intent precisely enough for agents to implement without constant correction. It requires context architectures that give agents the right information at the right scope. It requires eval designs that catch the classes of failure that automated checks miss. It requires review habits that focus human attention on the decisions with the highest systemic risk.

The floor has risen. Anyone can build software. The teams that build reliable, secure, maintainable software at agent speed are the ones who have done the engineering work that makes agents trustworthy. That work has not disappeared—it has moved.
