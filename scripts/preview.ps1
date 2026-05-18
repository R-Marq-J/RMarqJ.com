# Local static site preview for RMarqJ.com
# Run from the repo root: .\scripts\preview.ps1

$ErrorActionPreference = "Stop"

Write-Host "Starting local preview at http://localhost:8000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop." -ForegroundColor Yellow

if (Get-Command py -ErrorAction SilentlyContinue) {
    py -m http.server 8000
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
    python -m http.server 8000
} else {
    Write-Host "Python was not found. Install Python or use: start .\index.html" -ForegroundColor Red
    exit 1
}
