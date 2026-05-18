# AI Context for RMarqJ Website

This is a static HTML/CSS personal portfolio site for RMarqJ.

## Current stack
- Static HTML pages
- Shared CSS: `/css/style.css`
- Small JS file: `/js/main.js` currently only supports a Formspree-style contact form, but the current contact page does not include a form.
- No build system, package.json, database, or framework.

## Site structure
- `/` — home page
- `/about/` — about page with placeholder copy
- `/work/` — resume/portfolio page with placeholder experience, certifications, and skills
- `/blog/` — blog index with placeholder post cards; intended to be powered by Obsidian-written content later
- `/testimonials/` — testimonials page with placeholder testimonials
- `/contact/` — contact links and availability card
- `/projects/` — separate projects page exists but is not linked in the nav; homepage points “All projects” to `/work`

## Important cleanup goals
1. Replace all bracketed placeholders like `[Job Title]`, `[Cert]`, `[Post Title]`, etc.
2. Decide whether `/projects/` should be linked in the nav or merged into `/work/`.
3. Create real blog post pages and link the blog index cards to them instead of `#`.
4. Add a simple content editing workflow, preferably Obsidian → static HTML/Markdown → website.
5. Keep the site simple and professional for IT job opportunities: proof, projects, resume, contact.

## Constraints
- Preserve the existing visual style unless explicitly asked to redesign.
- Keep the site lightweight and beginner-maintainable.
- Avoid adding a complex framework unless there is a strong reason.
- Prefer clear files and simple manual edits over over-engineering.
