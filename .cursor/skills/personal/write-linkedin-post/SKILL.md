---
name: write-linkedin-post
description: >-
  Write a LinkedIn promotional post for a 7ynk3r blog article: single
  flowing prose, 900-1200 characters, hook in the first 150-210 characters,
  no bullet lists, no em dashes, minimal hashtags, natural call-to-action
  with the post URL. Use when asked to write, draft, or generate a LinkedIn
  post, LinkedIn message, or social promo for a blog post, or when the user
  says "/linkedin.new".
---

# Write LinkedIn Post

Converted from the old `.cursor/commands/linkedin.new.md` slash command.

## Steps

1. **Get today's date** in `YYYY-MM-DD` format, day of week, and month/day.

2. **Read context**:
   - Read `about.md` for the author's tone and perspective.
   - Read recent posts in `_posts/` to match writing style.
   - Use the latest post's actual title and live URL unless the user names
     a different post or thesis.

3. **Generate the post**:
   - Audience: senior engineers, engineering managers, technical founders.
   - Strong hook in the first 150-210 characters (before the "See more"
     fold).
   - Prose only, not a thread, not a bullet list.
   - Total length 900-1200 characters.
   - One concrete insight from the article, opinionated point of view.
   - Specific and authentic tone; avoid generic advice and mechanical
     phrasing.
   - No em dashes (`U+2014`); use commas, parentheses, semicolons, or
     separate sentences instead.
   - At most 2 hyper-niche hashtags, and only if they add something; default
     to none.
   - End with a clear call to action to read the full post, with the URL
     worked in naturally in the closing lines.

4. **Quality check** before returning:
   - [ ] Hook lands before character 210.
   - [ ] Total length is 900-1200 characters.
   - [ ] No bullet-list formatting.
   - [ ] No em dashes.
   - [ ] No generic hashtags.

5. **Display the result**: return only the final LinkedIn post text, no
   labels or explanation around it.
