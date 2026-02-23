---
layout: post
title: "Specs In, Code Out"
date: 2026-02-22
description: "How a PRD, seven RFCs, and a bash orchestrator turned specifications into working code without a human touching an editor."
---

I wrote a PRD for a sync engine and had an agent generate seven RFCs from it. Then I turned those RFCs into GitHub issues, pointed an agent orchestrator at the repo, and watched it turn specifications into working code.

The system builds itself. Not perfectly, not without iteration, but the shape of the pipeline is clear: human writes the spec, agent writes the code, another agent reviews, and the orchestrator manages the loop. The human never opens an editor to write production code.

This is what I meant when I said [specifications are becoming the real source code](/2026/01/19/specifications-are-becoming-the-real-source-code/). If the spec is the source, then code is a compilation target. And if code is a compilation target, then the compiler can be an agent.

## The pipeline

The project is a CRDT-based sync engine for restaurant kitchen tablets. Offline-first, field-level conflict resolution, peer-to-peer sync over gRPC. The kind of system where edge cases matter and distributed semantics are the hard part. The pipeline has four stages.

**PRD.** One document. Problem statement, use cases, functional requirements, data model, flows. Written in Markdown with Protobuf schemas and Mermaid diagrams. This is the contract between the product vision and the engineering work. It defines what the system does and why, in language precise enough for an agent to consume but readable enough for a product manager to review. Twelve use cases, nineteen functional requirements, eight non-functional targets.

**RFCs.** Once the PRD was solid, I had an agent generate seven RFCs from it—one per technical decision. The core data model. Field-level conflict resolution. Node identity and bootstrap. Transport layer. Interest-based subscriptions. Safe deletion and eviction. Priority sync. The agent decomposed the PRD's requirements into focused design documents, each answering the questions that would otherwise become production bugs: what happens when a tombstoned entity receives a new update? What if a tablet receives data from an unregistered node? What order must collections hydrate in?

I reviewed and refined the RFCs, but the agent did the heavy lifting of breaking a single product document into seven coherent technical designs. An eighth RFC compared the design against existing CRDT libraries to validate the approach. These questions were answered in prose, not in debuggers. The RFC forces clarity before any code exists.

**Issues.** Each requirement becomes a GitHub issue. Issues link to their RFC or PRD section. Dependencies are explicit: issue N requires issue N-1 to be closed. This turns the spec into a work queue with ordering constraints, and gives agents the context they need to implement each piece.

**Agents.** A bash script polls GitHub for issues labeled `agent:coder`. It ensures the repo is on latest main, builds a prompt from a template, and runs a coder agent. The coder reads the issue, follows links to the RFC, implements with TDD—E2E test first, then minimal code—pushes the branch, and posts a summary as an issue comment. The orchestrator captures the result, transitions the label to `agent:reviewer`, and runs the reviewer agent. The reviewer checks requirements compliance, code quality, and test coverage, then either approves and squash-merges to main, or requests changes and sends it back to the coder. The loop repeats until the issue is closed.

PRD, RFCs, issues, orchestrator, agents, code, review, merge. That is the pipeline.

## The orchestrator is a state machine on labels

The orchestrator itself is surprisingly simple. GitHub issue labels are the state. `agent:coder` means the coder should run. `agent:reviewer` means the reviewer should run. `agent:done` is terminal. A `retries:N` label tracks how many times the loop has cycled.

Transitions are configured in a few lines of YAML: coder succeeds, go to reviewer. Reviewer succeeds, mark done and close the issue. Either agent fails, send it back to the coder. A global retry cap prevents infinite loops.

The orchestrator does not know what a coder or reviewer does. It only knows the state machine. The intelligence lives in the skills—Markdown files that tell each agent its mission, workflow, and exit conditions. The coder skill says: fetch the issue, read linked docs, implement with TDD, push, post summary. The reviewer skill says: check the diff against requirements, run tests, post structured feedback or squash-merge.

This separation matters. The orchestrator is stable infrastructure. The skills evolve. You can add a security reviewer or a performance auditor by writing a new skill and adding a transition. The pipeline is extensible without changing the engine.

It is worth noting that tools like [Cursor](https://cursor.com) now ship first-class agent support—you can run agents directly from the IDE with full codebase context, skills, and subagents built in. The custom orchestrator I built was an experiment in understanding the workflow, but the infrastructure is catching up fast. The pattern matters more than the plumbing.

## What the human actually does

My role in this pipeline was three things: write the specs, create the issues, and review the output.

Writing the PRD took most of the effort. It defines the problem space, the data model with Protobuf schemas, and the flows with Mermaid sequence diagrams. This is where the hard engineering happened—not in code, but in the document that defines what the system should do and why. The RFCs were generated from the PRD by an agent, then reviewed and refined by a human. Thousands of words of design decisions, edge cases, and explicit non-goals—produced in minutes, validated over days.

Creating issues was also agent-assisted. The RFCs provided the structure; each section maps to one or more issues. Dependencies between issues mirror dependencies between concepts: you cannot implement subscriptions before the data model exists, and you cannot implement the merge engine before defining conflict resolution semantics.

Reviewing output was the feedback loop. When the reviewer agent requested changes, it posted specific, actionable items in the issue. The coder agent addressed the feedback and pushed again. Most issues closed in one or two cycles. The pattern was consistent: when the spec was precise, the agent got it right quickly. When the spec was ambiguous, the agent made assumptions and the reviewer caught them.

## The spec is the bottleneck, and that is correct

The slowest part of this pipeline is writing the PRD. That is exactly right. If the hardest work in software is understanding what to build and why, then that is where humans should spend their time. The PRD captures the judgment, domain knowledge, and taste that an agent cannot supply—what matters to the business, which tradeoffs are acceptable, what must never happen. Once that document exists, an agent can decompose it into RFCs, and those RFCs can be decomposed into issues, and those issues can be implemented and reviewed by agents. The human's contribution compounds at every stage.

Once those decisions are captured in a document, the agent can implement them. The code becomes a projection of the spec. Tests validate behavior against the spec, not against the implementation. When storage is refactored from one backend to another, the tests still pass because they test the contract, not the internals.

This is the full arc. [Specifications are the real source code](/2026/01/19/specifications-are-becoming-the-real-source-code/). When they are missing, [reverse them from the product](/2026/02/16/reverse-prd-when-the-spec-is-missing/). When they exist, feed them to agents and let the pipeline compile specs into working software.

The human writes the spec. The agent writes the code. And between them, a bash script manages the loop.

The full source is on [GitHub](https://github.com/7ynk3r/krux2)—PRD, RFCs, orchestrator, skills, and all the agent-generated code.

← [Reverse PRD: When the Spec Is Missing](/2026/02/16/reverse-prd-when-the-spec-is-missing/)
