---
name: write-post
description: >-
  Write a new blog post for the 7ynk3r Jekyll blog (this repo): matches JM's
  established voice, banned verbal tics, and file/frontmatter conventions,
  then runs the humanizer skill as a final pass before saving. Use when asked
  to write, draft, or generate a new blog post for this repo, when the user
  gives a post topic/description, or when the user says "/post.new".
---

# Write Post

Converted from the old `.cursor/commands/post.new.md` slash command.

## Steps

1. **Get today's date** in `YYYY-MM-DD` format, day of week, and month/day
   (e.g. "Monday, October 2"), unless the user gave a different target date.

2. **Read context**:
   - Read `about.md` for the blog's focus and author style.
   - Read recent posts in `_posts/` for voice, format, and topics already
     covered.
   - Read `README.md`'s "Writing Style" section for standing conventions
     (enterprise-by-default use cases, structural-alternatives workflow).

3. **Generate the post**:
   - Frontmatter, exact format:
     ```yaml
     ---
     layout: post
     title: "Your Compelling Title Here"
     date: YYYY-MM-DD
     description: "Brief one-sentence description of the post"
     ---
     ```
   - 800-1200 words, markdown with clear headings (`##`, `###`).
   - Match JM's voice: thoughtful, practical, directly relevant to today's
     engineering challenges.
   - No em dashes (`U+2014`); use commas, parentheses, semicolons, or
     separate sentences instead.
   - **Do not add a manual "← previous post" link at the end of the body.**
     `_layouts/post.html` already renders automatic previous/next navigation
     from `page.previous`/`page.next`. A manual link duplicates that button
     and can point to the wrong post once new posts are added.

   **Voice and argument**
   - Each paragraph makes a distinct move; never restate the previous
     paragraph in different words.
   - The last sentence of the body is the final thought. Never add a
     separate "Final Thought" or "Conclusion" section that just summarizes
     what the post already said.
   - Put personal stakes on the line. Use "I" with specificity: what JM
     observed, built, decided, or got wrong. Avoid "some teams I've seen",
     "forward-thinking organizations", "high-performing teams". If you
     cannot name the specific team or project, describe the situation
     concretely enough that it reads as real.
   - Do not hedge the conclusion. If the post argues X, end on X.

   **Banned verbal tics** (never use these constructions):
   - "The future belongs to..."
   - "The companies that X will Y. The ones that don't will Z."
   - "This isn't about replacing X, it's about Y."
   - "X is not the goal. Y is the goal."
   - Any section titled "Final Thought", "Implications", or "What This Means
     for Engineering Teams" that just restates the thesis.

   **Structure**
   - Prefer prose over bullet lists. Use a list only when the items are
     genuinely enumerable and parallel, not to avoid writing the argument
     that would connect them.
   - Open with a concrete scene, decision, or observation, not a trend
     statement.
   - Do not name-drop AI tools (Copilot, Claude, Cursor, etc.) as a
     substitute for a concrete example. Describe what actually happened or
     was built.
   - If referencing an external person or project, the post must contain at
     least as much original argument as commentary on that reference.
   - If asked for multiple structural rewrites of the same topic, write each
     as its own file in `_posts/` (same date, distinct slug) instead of only
     pasting drafts in chat, so they can be diffed and deleted directly.

4. **Save the file**:
   - Slugify the title (lowercase, hyphens, no special chars).
   - Save as `_posts/YYYY-MM-DD-title-slug.md`. If title extraction fails,
     use `_posts/YYYY-MM-DD-new-post.md`.
   - Filename date and frontmatter `date` must match.

5. **Humanize the post** (required):
   - Apply the humanizer skill (`skills/blader/SKILL.md`) to the saved file
     in **file mode**: rewrite in place, leave frontmatter/code
     blocks/link targets untouched.
   - Run the full loop: draft rewrite, audit for lingering AI patterns,
     final rewrite with no em or en dashes.
   - Report a short summary of what changed (do not paste the whole post
     back).

6. **Display the result**: confirm the file location and summarize what the
   humanizer changed.
