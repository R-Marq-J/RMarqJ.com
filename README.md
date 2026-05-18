# RMarqJ.com

Static self-hosted portfolio website for RMarqJ.

## Stack

- Static HTML pages
- Shared CSS: `css/style.css`
- Shared JavaScript: `js/main.js`
- No npm, no framework, no build step
- Designed to be edited in VS Code/Codex and published through Git

## Main folders

```text
/
├── index.html
├── about/index.html
├── work/index.html
├── blog/index.html
├── projects/index.html
├── testimonials/index.html
├── contact/index.html
├── css/style.css
├── js/main.js
├── AI_CONTEXT.md
└── WORKFLOW.md
```

## Daily workflow

```powershell
cd "D:\Github@R-Marq-J\rmarqj.com"
code .
.\scripts\preview.ps1
```

Edit files, then publish to Git:

```powershell
.\scripts\publish.ps1 "Update site content"
```

## Rules

1. Treat this repo as the source of truth.
2. Do not manually edit live files on the server except for emergencies.
3. Commit before major AI/Codex edits.
4. Keep the site simple until the static workflow is reliable.
5. Upgrade to Markdown/Eleventy later only after the edit/commit/deploy loop is boring.
