# RMarqJ.com Git Publish + Self-Host Workflow

This site is a static HTML/CSS/JS website. That is good. Keep it simple.

## The system

```text
VS Code / Codex
      ↓
Local static site files
      ↓
Git commit
      ↓
Push to GitHub
      ↓
Deploy to Proxmox webserver
      ↓
rmarqj.com updates
```

## Local project path

```powershell
cd "D:\Github@R-Marq-J\rmarqj.com"
```

## First-time import from zip

Run this only when replacing the repo with the zip contents.

```powershell
cd "D:\Github@R-Marq-J\rmarqj.com"
git status
git add .
git commit -m "Checkpoint before importing static site base"
tar -xzf "D:\rmarqj.com v4.1\rmarqj-live.tar.gz" -C .
git status
git add .
git commit -m "Set static site as publishing base"
git push origin main
```

If Git says there is nothing to commit on the checkpoint step, continue.

## Preview locally

Recommended:

```powershell
.\scripts\preview.ps1
```

Then open:

```text
http://localhost:8000
```

Fallback:

```powershell
start .\index.html
```

The local web server preview is better because absolute paths like `/css/style.css` work correctly.

## Normal edit cycle

```powershell
cd "D:\Github@R-Marq-J\rmarqj.com"
git pull
code .
.\scripts\preview.ps1
```

Edit files.

Then:

```powershell
git status
git add .
git commit -m "Update site content"
git push origin main
```

Or use:

```powershell
.\scripts\publish.ps1 "Update site content"
```

## Codex editing rules

Use Codex for targeted changes, not random full-site rewrites.

Good prompts:

```text
Update the Work page to sound more professional for entry-level IT roles. Keep the existing design and CSS classes. Do not change nav, file paths, or global styling.
```

```text
Replace placeholder content on this page with concise portfolio copy. Preserve the existing HTML structure.
```

```text
Create one blog post page under /blog/my-first-homelab/ using the existing visual style. Then update /blog/index.html to link to it.
```

Bad prompts:

```text
Redesign my whole site.
```

```text
Make everything better.
```

## Deployment options

### Option A — GitHub Actions deploys to Proxmox

Best long-term path if GitHub can SSH into your server.

Use `.github/workflows/deploy-to-proxmox.yml.example` as a template. Rename it to:

```text
.github/workflows/deploy-to-proxmox.yml
```

Required GitHub repo secrets:

```text
DEPLOY_HOST
DEPLOY_USER
DEPLOY_KEY
DEPLOY_PATH
KNOWN_HOSTS
```

Recommended server path:

```text
/var/www/rmarqj.com
```

Recommended deploy user:

```text
deploy
```

### Option B — Manual deploy from your computer

Use this if your Proxmox server is reachable from your machine over SSH but not reachable by GitHub Actions.

Copy the example:

```powershell
copy .\scripts\deploy-manual.ps1.example .\scripts\deploy-manual.ps1
```

Edit the variables at the top of the file:

```powershell
$DeployUser = "deploy"
$DeployHost = "YOUR_SERVER_IP_OR_HOSTNAME"
$DeployPath = "/var/www/rmarqj.com"
```

Then run:

```powershell
.\scripts\deploy-manual.ps1
```

## Server rule

The live web directory should receive published files. It should not be your main editing workspace.

Good:

```text
local repo → git → deploy → /var/www/rmarqj.com
```

Bad:

```text
edit random files directly in /var/www/rmarqj.com
```

## Next cleanup targets

1. Replace bracketed placeholders in `/about`, `/work`, `/projects`, `/blog`, `/testimonials`, and `/contact`.
2. Decide whether `/projects` gets added to the nav or merged into `/work`.
3. Create real blog post folders like `/blog/homelab-rebuild/`.
4. Add resume PDF later under `/assets/` or `/files/`.
5. After the static workflow is stable, consider Markdown/Eleventy.
