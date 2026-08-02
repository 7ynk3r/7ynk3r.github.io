# Generate New Blog Post

Creates a new blog post for the Jekyll site using the provided description.

## Usage

`/post.new {description}`

## Steps

1. **Get today's date**: Get the current date in `YYYY-MM-DD` format, day of
   week, and month/day (e.g., "Monday, October 2")

2. **Read context**:
   - Read `about.md` to understand the blog's focus and author style
   - Read all my posts from `_posts/` to understand writing style, format, and
     topics

3. **Generate the blog post**:
   - Use the provided `{description}` as the topic/theme
   - Create a complete, ready-to-publish blog post starting with this exact YAML
     frontmatter:
     ```yaml
     ---
     layout: post
     title: "Your Compelling Title Here"
     date: YYYY-MM-DD
     description: "Brief one-sentence description of the post"
     ---
     ```
   - Write 800-1200 words covering the topic
   - Use markdown with clear headings (##, ###)
   - Match JM's writing style: thoughtful, practical, directly relevant to
     today's engineering challenges
   - Avoid em dashes (`U+2014`); use commas, parentheses, semicolons, or
     separate sentences instead

   **Voice and argument**
   - Each paragraph must make a distinct move. Never restate what the previous
     paragraph said in different words.
   - The last sentence of the body is the final thought. Never add a separate
     "Final Thought" or "Conclusion" section that just summarizes what the post
     already said.
   - Put personal stakes on the line. Use "I" with specificity: what JM
     observed, built, decided, or got wrong. Avoid: "some teams I've seen",
     "forward-thinking organizations", "high-performing teams". If you cannot
     name the specific team or project, describe the situation concretely enough
     that it reads as real.
   - Do not hedge the conclusion. If the post argues X, end on X. Do not soften
     it with "of course, context matters" or "this isn't for everyone".

   **Banned verbal tics** (never use these constructions):
   - "The future belongs to..."
   - "The companies that X will Y. The ones that don't will Z."
   - "This isn't about replacing X, it's about Y."
   - "X is not the goal. Y is the goal."
   - Any section titled "Final Thought", "Implications", or "What This Means for
     Engineering Teams" that just restates the post's thesis.

   **Structure**
   - Prefer prose over bullet lists. Use a list only when the items are
     genuinely enumerable and parallel, not when you are avoiding writing the
     argument that would connect them.
   - Open with a concrete scene, decision, or observation — not a trend
     statement. The first paragraph should make the reader feel something
     specific happened.
   - Do not name-drop AI tools (GitHub Copilot, Claude, Cursor, etc.) as a
     substitute for a concrete example. Tool names are not examples. Describe
     what actually happened or was built.
   - If referencing an external person or project (e.g. Karpathy), the post
     must contain at least as much original argument as it does commentary on
     that reference. The reader should leave thinking about JM's insight, not
     the reference's.

4. **Save the file**:
   - Extract the title from the frontmatter
   - Convert title to slug (lowercase, replace spaces with hyphens, remove
     special chars)
   - Save as `_posts/YYYY-MM-DD-title-slug.md`
   - If title extraction fails, use `_posts/YYYY-MM-DD-new-post.md`

5. **Humanize the post** (required):
   - Apply the humanizer skill from `skills/blader/SKILL.md` to the saved
     file, operating in **file mode**.
   - Rewrite the prose in place. Leave the YAML frontmatter, any code blocks,
     and link targets untouched.
   - Run the full loop: draft rewrite → audit for lingering AI patterns →
     final rewrite with no em or en dashes.
   - Report a short summary of the changes made (do not paste the whole post
     back).

6. **Display the result**: Confirm the file location and summarize what the
   humanizer changed.
