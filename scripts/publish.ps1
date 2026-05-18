# Commit and push site changes.
# Usage: .\scripts\publish.ps1 "Update site content"

$ErrorActionPreference = "Stop"

$Message = $args[0]
if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "Update site content"
}

Write-Host "Checking Git status..." -ForegroundColor Cyan
git status

Write-Host "Adding changes..." -ForegroundColor Cyan
git add .

$Status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($Status)) {
    Write-Host "No changes to commit." -ForegroundColor Yellow
    exit 0
}

Write-Host "Committing: $Message" -ForegroundColor Cyan
git commit -m $Message

Write-Host "Pushing to origin..." -ForegroundColor Cyan
git push origin main

Write-Host "Published to Git." -ForegroundColor Green
