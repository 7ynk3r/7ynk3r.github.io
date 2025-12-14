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
   - Avoid excessive bullet points (prefer prose)
   - Include actionable insights, not just theory

4. **Save the file**:
   - Extract the title from the frontmatter
   - Convert title to slug (lowercase, replace spaces with hyphens, remove
     special chars)
   - Save as `_posts/YYYY-MM-DD-title-slug.md`
   - If title extraction fails, use `_posts/YYYY-MM-DD-new-post.md`

5. **Display the result**: Show the generated post and confirm the file location
