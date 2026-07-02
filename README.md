# Daily Horizon

A small GitHub Pages blog for the daily "horizon broadener" essays — one
deliberately off-path idea each morning, well outside the day job.

## How it works

- Each morning the scheduled task writes that day's essay into `_drafts/` as a
  markdown file and delivers it in chat for review.
- GitHub Pages does **not** build `_drafts/`, so nothing is live until you
  promote a draft. This is the review gate.
- When you're happy with a draft, publish it:

  ```bash
  ./publish.sh 2026-07-03-some-slug.md   # moves _drafts -> _posts, commits
  git push                               # this is what makes it public
  ```

## Layout

```
_config.yml   Jekyll config (minima theme)
index.md      Home page — auto-lists published posts
about.md      About page
_posts/       Published essays (YYYY-MM-DD-title.md)
_drafts/      Pending essays, reviewed before publishing (not built by Pages)
publish.sh    Promote a reviewed draft to _posts and commit
```

## One-time GitHub setup

1. Create an empty repository on GitHub (e.g. `daily-horizon`).
2. Add it as the remote and push:

   ```bash
   git remote add origin https://github.com/jonstraveladventures/daily-horizon.git
   git push -u origin main
   ```

3. In the repo: **Settings -> Pages -> Build and deployment**, set
   **Source: Deploy from a branch**, **Branch: `main` / `root`**. Save.
4. The site appears at `https://jonstraveladventures.github.io/daily-horizon/`
   within a minute or two.

## Local preview (optional)

```bash
bundle exec jekyll serve --drafts   # renders drafts too, at localhost:4000
```
