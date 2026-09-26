## Cursor Cloud specific instructions

This is a Jekyll (Ruby) static blog. See `README.md` for project overview, post format, and content guidelines.

### Running the dev server

```
bundle exec jekyll serve --host 0.0.0.0 --port 4000
```

Site is served at `http://localhost:4000`. Jekyll has built-in live-reload via `--watch` (enabled by default with `serve`).

### Key caveats

- **Bundler path**: Gems are installed to `vendor/bundle` (configured via `.bundle/config`). Always use `bundle exec` to run Jekyll commands.
- **No linter / test suite**: This project has no automated tests or lint configuration. Validation is done by building the site (`bundle exec jekyll build`) and visually reviewing.
- **Gemfile duplicates**: The `Gemfile` lists `jekyll-feed` and `jekyll-seo-tag` twice (top-level and inside `:jekyll_plugins` group). Bundler warns but works fine.
- **System Ruby**: Ubuntu 24.04 system Ruby 3.2 is used. No `.ruby-version` or version manager needed.
- **Future-dated posts are not hidden at build time**: `_config.yml` sets `future: true`, so a post dated ahead builds and is reachable at its permalink, and `jekyll-feed` includes it, immediately on deploy. The only gating is client-side JS in `_layouts/default.html` that hides `article[data-pubdate]` entries on `index.md`/`archive.md` based on the visitor's local clock. Scheduling a post only delays it from those two listing pages, not from direct access, search engines, or the feed.

### Skills

- **`skills/blader/SKILL.md`** (humanizer): removes signs of AI-generated writing, sourced from [blader/humanizer](https://github.com/blader/humanizer). **You MUST apply this as the final editing pass on every post you write.** After drafting, run the full loop (draft → audit → rewrite) in **file mode**: rewrite the file in place, report a short summary of what changed, leave frontmatter/code blocks/link targets untouched.
- **`.cursor/skills/personal/write-post/SKILL.md`**: generates a new blog post matching this repo's voice, structure, and banned-phrase rules, then runs the humanizer skill above before saving. Use this instead of freehanding a post from memory.
- **`.cursor/skills/personal/write-linkedin-post/SKILL.md`**: generates a LinkedIn promo post for a blog article (900-1200 chars, hook in the first 210 chars, prose only, no em dashes). Use this instead of freehanding a LinkedIn post; it replaces the old `.cursor/commands/linkedin.new.md` slash command.

These two skills replace the former `.cursor/commands/post.new.md` and `.cursor/commands/linkedin.new.md` slash commands. Prefer them over improvising format from old posts or memory.
