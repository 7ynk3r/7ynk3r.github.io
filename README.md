# 7ynk3r Blog

A Jekyll-based personal blog about engineering leadership, AI & development,
systems thinking, and team dynamics.

## Generating a New Article

There are two ways to generate a new blog post: automated (using a script) or
manual.

### Automated Approach (Recommended)

The `test-workflow-local.sh` script automates the entire article generation
process using the Gemini API.

#### Prerequisites

1. **Set up your Gemini API key**:
   ```bash
   echo 'export GEMINI_API_KEY="your-api-key-here"' >> ~/.env
   source ~/.env
   ```

2. **Make the script executable** (if needed):
   ```bash
   chmod +x test-workflow-local.sh
   ```

#### Usage

Simply run the script:

```bash
./test-workflow-local.sh
```

The script will:

- Get today's date automatically
- Call the Gemini API with a prompt based on your blog's style and topics
- Generate a complete blog post (800-1200 words) with proper YAML frontmatter
- Save it to `_posts/YYYY-MM-DD-title-slug.md`

After generation:

1. Review the generated post
2. Edit if needed
3. Commit when ready:
   `git add _posts/YYYY-MM-DD-title-slug.md && git commit -m 'Add new blog post'`

### Manual Approach

If you prefer to generate articles manually or want more control:

#### Step 1: Get Topic Ideas

1. Analyze `about.md` and recent posts in `_posts/` to understand format, style,
   and topics
2. Research current trends/news related to your usual subjects
3. Get 5 topic suggestions that haven't been covered before

#### Step 2: Create the Post

1. **Get today's date** in `YYYY-MM-DD` format
2. **Generate the post** following your writing style:
   - Use the YAML frontmatter format (see below)
   - Write 800-1200 words
   - Avoid bullet points (use prose instead)
   - Match your writing style from previous posts
   - Focus on: engineering leadership, AI & development, systems thinking, team
     dynamics
3. **Save the file** as `_posts/YYYY-MM-DD-title-slug.md`

#### Step 3: Review & Publish

1. Review all changes: `git status`
2. Create a commit following previous commit format
3. Push your changes

## Post Format Requirements

### File Naming

Posts must follow this naming convention:

```
_posts/YYYY-MM-DD-title-slug.md
```

Example: `_posts/2025-10-02-why-engineering-teams-are-splitting.md`

### YAML Frontmatter

Every post must start with this exact frontmatter format:

```yaml
---
layout: post
title: "Your Compelling Title Here"
date: 2025-10-02
description: "Brief one-sentence description of the post"
---
```

### Content Guidelines

- **Length**: 800-1200 words
- **Style**: Thoughtful, practical, directly relevant to today's engineering
  challenges
- **Format**: Use markdown with clear headings (`##`, `###`)
- **Focus**: Actionable insights, not just theory
- **Avoid**: Excessive bullet points (prefer prose)

### Topics Covered

- Engineering leadership and team dynamics
- AI's impact on software development
- System architecture and scalability
- Technical career growth
- Modern development practices

## Local Development

### Running Jekyll Locally

```bash
bundle install
bundle exec jekyll serve
```

Visit `http://localhost:4000` to preview your site.

### Project Structure

```
├── _config.yml          # Jekyll configuration
├── _layouts/            # HTML layouts
├── _posts/              # Blog posts (YYYY-MM-DD-title.md)
├── _site/               # Generated site (don't edit)
├── about.md             # About page
├── assets/              # CSS and images
└── index.md             # Homepage
```

## Writing Style

Based on existing posts, the blog maintains:

- **Tone**: Thoughtful, practical, conversational
- **Structure**: Clear headings, logical flow, actionable insights
- **Focus**: Real-world engineering challenges and solutions
- **Perspective**: Personal experience combined with industry observations

Review existing posts in `_posts/` to understand the style better.

## Deployment

This is a GitHub Pages site. Simply push to the repository and GitHub Pages will
automatically build and deploy.

## License

Personal blog - all rights reserved.
