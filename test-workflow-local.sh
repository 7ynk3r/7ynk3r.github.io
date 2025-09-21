#!/bin/bash

# Local test script for the blog post generation workflow
set -e

# Load environment variables
source ~/.env

echo "🚀 Starting local workflow test..."
echo "📅 Getting date information..."

# Get today's date and calendar info (same as GitHub Action)
TODAY=$(date '+%Y-%m-%d')
DAY_OF_WEEK=$(date '+%A')
MONTH_DAY=$(date '+%B %d')

echo "Today is $DAY_OF_WEEK, $MONTH_DAY ($TODAY)"

# Create the prompt for Gemini
PROMPT="Write a complete blog post for JM's software engineering blog. Today is $DAY_OF_WEEK, $MONTH_DAY.

The blog focuses on engineering leadership, AI & development, systems thinking, and team dynamics. Check the about.md and recent posts in _posts/ to understand the topics and style.

Create a complete, ready-to-publish blog post starting with this exact YAML frontmatter format:

---
layout: post
title: \"Your Compelling Title Here\"
date: $TODAY
description: \"Brief one-sentence description of the post\"
---

Then write 800-1200 words covering a current trend in:
- Engineering leadership and team dynamics
- AI's impact on software development
- System architecture and scalability
- Technical career growth
- Modern development practices

Use markdown with clear headings (##, ###), focus on actionable insights, and match JM's writing style: thoughtful, practical, and directly relevant to today's engineering challenges.

Write the complete post now, do not ask for confirmation. Do not wrap the YAML frontmatter in code blocks."

echo "🤖 Calling Gemini API to generate blog post..."

# Call Gemini API directly using curl
echo "🔑 Using API key: ${GEMINI_API_KEY:0:10}..."

# Create JSON payload with proper escaping
JSON_PAYLOAD=$(jq -n --arg prompt "$PROMPT" '{
  contents: [{
    parts: [{
      text: $prompt
    }]
  }]
}')

GEMINI_RESPONSE=$(curl -s -X POST \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$GEMINI_API_KEY" \
  -H 'Content-Type: application/json' \
  -d "$JSON_PAYLOAD" | jq -r '.candidates[0].content.parts[0].text // empty')

if [ -z "$GEMINI_RESPONSE" ]; then
  echo "❌ Error: No response from Gemini API"
  exit 1
fi

echo "✅ Blog post generated successfully!"
echo ""
echo "📝 GENERATED BLOG POST:"
echo "======================="
echo "$GEMINI_RESPONSE"
echo "======================="
echo ""

# Extract title for filename
TITLE_SLUG=$(echo "$GEMINI_RESPONSE" | grep '^title:' | head -1 | sed 's/title: *"//g' | sed 's/".*//g' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | tr ' ' '-' | sed 's/--*/-/g' | sed 's/^-//g' | sed 's/-$//g')

# If title extraction fails, use a fallback
if [ -z "$TITLE_SLUG" ] || [ ${#TITLE_SLUG} -lt 5 ]; then
  TITLE_SLUG="local-test-post"
fi

FILENAME="_posts/${TODAY}-${TITLE_SLUG}.md"

echo "💾 Saving blog post to: $FILENAME"
echo "$GEMINI_RESPONSE" > "$FILENAME"

echo ""
echo "🎉 Local workflow test completed successfully!"
echo "📄 Blog post saved to: $FILENAME"
echo ""
echo "Next steps:"
echo "- Review the generated post"
echo "- Edit if needed"
echo "- Commit when ready: git add $FILENAME && git commit -m 'Add new blog post'"