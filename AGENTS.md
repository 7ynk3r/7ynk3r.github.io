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

### Skills

The project ships a local copy of the **humanizer** skill (`skills/blader/SKILL.md`). This skill removes signs of AI-generated writing and is sourced from [blader/humanizer](https://github.com/blader/humanizer).

**You MUST apply the humanizer skill as the final editing pass on every post you write.** After drafting a post, run the full humanizer loop (draft → audit → rewrite) on the prose before saving the file. Operate in **file mode**: rewrite the file in place and report a short summary of what changed rather than pasting the whole rewrite back. Leave YAML frontmatter, code blocks, and link targets untouched.
