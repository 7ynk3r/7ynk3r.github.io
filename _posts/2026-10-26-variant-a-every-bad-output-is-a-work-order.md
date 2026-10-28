---
layout: post
title: "Every Bad Output Is a Work Order"
date: 2026-10-26
description: "A bad AI result is a defect report on your spec. Treat prompting like a factory floor, with stations, inspection, and a jig, and a cheap model starts beating an expensive one."
---

I had a report generator that kept ignoring the format. Every Monday it was supposed to turn a pile of change tickets into a summary an auditor could read: one section per system, every change tied to its approval, nothing editorial. Every Monday it came back as a friendly essay, with nice paragraphs, a bolded takeaway at the top, and approvals mentioned whenever the model felt like it. One morning I was rewriting the prompt for the third time, putting the word MUST in capital letters, when I stopped and read what I had actually sent it.

The prompt said "summarize these changes for the audit, keep it clean and professional." That was the whole spec. Clean meant something specific to me: a table, no adjectives, the approval ID next to every line. None of that was on the page. The model had filled the gap with its own idea of clean, and its idea was a blog post. I had been annoyed at the machine for an hour, and the machine had done what I asked.

## The part that came off the line wrong

On a factory floor, a bad part is information. Nobody kicks the press. Someone pulls the part, measures it, and finds out which station drifted. The defect gets read as a report about the process, and the process gets fixed so the next thousand parts come out right.

Most people prompt the opposite way. They put a coin in, get something they don't like, and either put in another coin with the same request or walk away saying the tool is overrated. That's a vending machine relationship, and it keeps the frustration pointed at the model, where it can't do anything.

The frustration I felt that Monday was the most useful thing in the room. It meant a requirement in my head had never made it onto the page. Once I read the bad essay as a work order instead of an insult, it practically wrote the next version of the spec for me: no headings except system names, one row per change, approval ID in the second column, no summary sentence, and a visible flag on any change without an approval instead of a smooth paragraph around it. Every one of those lines came from something the bad output did. I didn't have to dream them up in the abstract. The model showed me where my thinking had holes, for free, in under a minute.

Most people treat iteration as the tax you pay for using AI badly. I think iteration is the skill. Each pass gets me closer to what I wanted, and I usually didn't know all of what I wanted until I saw what I didn't.

<figure>
  <img src="{{ '/assets/diagrams/variant-a/assembly-line.svg' | relative_url }}" alt="A process diagram: a spec feeds a draft station, then a shaping station, then an inspection station, then output. A dashed loop runs from inspection back to the spec, labeled reject equals new requirement.">
  <figcaption>Each station does one job. Whatever fails inspection goes back upstream as a new line in the spec.</figcaption>
</figure>

## Stations, not wishes

The second thing I changed was the shape of the job. One giant prompt that drafts, formats, checks, and polishes is a single craftsman doing every step by eye. When it goes wrong, you can't tell which step failed.

So I split it into stations. One step pulls the facts out of the tickets and does nothing else. Another pours those facts into a fixed template. A third checks the result against rules I can write down: every row has an approval ID, no row has an adjective, the number of rows matches the number of tickets. When the check fails, I don't patch the output by hand at the end. The failure goes back upstream and becomes a new line in the spec, so the same defect doesn't show up next week.

That loop is where I spend most of my time now, and it's the least glamorous part of the setup. It's also the part that makes Monday boring, which is exactly what I want from an audit report.

## The jig

Woodworkers and machinists have a name for the thing that makes precision cheap. A jig is a guide that holds the material and the tool in the right relationship, so a person with ordinary skill makes the same cut a master would, every time. Nobody gets smarter. The precision moves out of the person's hands and into the fixture.

<figure>
  <img src="{{ '/assets/diagrams/variant-a/jig.svg' | relative_url }}" alt="Two side by side panels. Left: the same weekly request goes to a brilliant generalist model that decides the format each time, producing varied parts. Right: the same request goes to a cheap fast model held inside a jig of schema, examples, checks, and a retry rule, producing the same part every time.">
  <figcaption>The artisan decides the format on every run. The jig decides it once, and a cheaper model just follows it.</figcaption>
</figure>

A harness is a jig for a model. It decides what goes into the context window and what stays out, which tools the model can call and in what order, what it remembers between runs, and which evals have to pass before anything leaves the building. That's where the judgment lives. The model is the engine, and the harness is the steering wheel, the brakes, and the dashboard. Without it I'm white-knuckling a fast car with no road under it.

## Why the cheap machine wins

Once the report generator had a jig, I tried something I wouldn't have dared before and swapped the large, expensive model for a small, fast one. The small one is less clever. Left alone with my original one-line prompt, it would have produced something worse than the friendly essay. Inside the harness it didn't need to be clever. It needed to follow the template, fill the columns, and let the checks catch what it missed, and it did that reliably, faster, and for a fraction of the cost.

Factories beat artisans at scale for the same reason. You don't put a master craftsman at every station when the fixture does the precision work. A cheaper model inside a tight harness can beat a frontier model running loose, because the harness absorbs the intelligence the model doesn't have. The frontier model still earns its price on the hard one-off problems, where nobody has built the jig yet. Most of the work in a regulated shop is the other kind: the same report, the same review, the same reconciliation, every week.

## Who still needs a harness

I keep hearing that harnesses are a temporary crutch, and that the next generation of models will figure out the format, the rules, and the checks on their own. Maybe a future model will guess my audit table from "keep it clean." It still won't know that our auditor wants approval IDs in the second column unless someone tells it, and it won't keep doing it on the four hundredth run unless something checks. Cars got far more powerful engines over the decades and kept their steering wheels.

Repetitive work stays good because something holds it in place. A person used to have that job. A harness has it now, and the person moves up to designing the harness, which is where the real thinking was all along.

That Monday I thought I was debugging a model, but I was debugging my own spec, and the bad output was the most honest review my thinking had gotten in weeks.
