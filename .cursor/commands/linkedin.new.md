# Generate New LinkedIn Post

Creates a LinkedIn-native promotional post based on a blog article.

## Usage

`/linkedin.new {blog_post_title_or_thesis}`

## Steps

1. **Get today's date**: Get the current date in `YYYY-MM-DD` format, day of
   week, and month/day.

2. **Read context**:
   - Read `about.md` to understand the author's tone and perspective.
   - Read recent posts in `_posts/` to match writing style.
   - If available, use the latest post title and URL from the repository context.

3. **Generate the LinkedIn post**:
   - Use `{blog_post_title_or_thesis}` as the core topic if no fresh post is
     provided.
   - Write one LinkedIn post for a 2026 audience of senior engineers,
     engineering managers, and technical founders.
   - Start with a strong hook in the first 150-210 characters (before the
     "See more" fold).
   - Write as prose, not a thread and not a bullet list.
   - Keep total length between 900 and 1200 characters.
   - Use an opinionated point of view with one concrete insight from the
     article.
   - Keep the tone specific and authentic; avoid generic advice and mechanical
     phrasing.
   - Avoid generic hashtags. If needed, use at most 2 hyper-niche hashtags.
   - End with a clear call to action to read the full post and include the URL
     naturally in the closing lines.

4. **Quality check**:
   - Confirm hook appears before character 210.
   - Confirm total length is between 900 and 1200 characters.
   - Confirm no bullet-list formatting is used.
   - Confirm no generic hashtags are present.

5. **Display the result**:
   - Return only the final LinkedIn post text, with no labels or explanation.
