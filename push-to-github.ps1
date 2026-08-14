# push-to-github.ps1
# Stages, commits, and pushes all changes to mikesell-pages

Set-Location $PSScriptRoot

git add -A

$status = git status --porcelain
if (-not $status) {
    Write-Host "Nothing to commit - already up to date." -ForegroundColor Green
    exit 0
}

Write-Host ""
Write-Host "Changes staged:" -ForegroundColor Cyan
git status --short
Write-Host ""

$msg = Read-Host "Commit message (Enter for timestamp)"
if ([string]::IsNullOrWhiteSpace($msg)) {
    $msg = "update $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

git commit -m $msg
git push

Write-Host ""
Write-Host "Pushed to GitHub." -ForegroundColor Green
