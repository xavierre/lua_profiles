param(
    [string]$BranchName = ""
)

# Stop on errors
$ErrorActionPreference = "Stop"

# --- Settings ---
$UpstreamRemote = "upstream"
$UpstreamBranch = "master"
$UpstreamPath   = "common"
$LocalPath      = "common"
$MainBranch     = "main"

# Generate branch name if none provided
if ([string]::IsNullOrWhiteSpace($BranchName)) {
    $date = Get-Date -Format "yyyyMMdd-HHmm"
    $BranchName = "update-common-$date"
}

Write-Host "== Sync common folder (ADD + OVERWRITE) from ${UpstreamRemote}/${UpstreamBranch}:${UpstreamPath} to .\${LocalPath} =="

# Ensure we're in a git repo
git rev-parse --is-inside-work-tree | Out-Null

# Make sure main is up to date
Write-Host "`n[1/6] Checkout + update main"
git checkout $MainBranch
git pull

# Fetch upstream
Write-Host "`n[2/6] Fetch upstream"
git fetch $UpstreamRemote

# Create new branch
Write-Host "`n[3/6] Create branch: $BranchName"
git checkout -b $BranchName

# Ensure local path exists
if (!(Test-Path ".\$LocalPath")) {
    New-Item -ItemType Directory -Path ".\$LocalPath" | Out-Null
}

# Export upstream/common into a temp folder
Write-Host "`n[4/6] Export upstream common folder to temp"
$tmpRoot = Join-Path $env:TEMP ("sync-common-" + [guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tmpRoot | Out-Null

$zipFile = Join-Path $tmpRoot "common.zip"

git archive --format=zip --output $zipFile "$UpstreamRemote/$UpstreamBranch" $UpstreamPath
Expand-Archive -Force $zipFile $tmpRoot

# Copy/overwrite files into local common/ (do NOT delete extras)
Write-Host "`n[5/6] Copy + overwrite files into .\$LocalPath (extras remain untouched)"
$exportedCommonPath = Join-Path $tmpRoot $UpstreamPath

Copy-Item -Path (Join-Path $exportedCommonPath "*") `
          -Destination ".\$LocalPath" `
          -Recurse -Force

# Cleanup temp folder
Remove-Item -Recurse -Force $tmpRoot

# Commit changes (if any)
Write-Host "`n[6/6] Commit + push"
git add $LocalPath

$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "No changes detected. Nothing to commit."
    exit 0
}

git commit -m "Update common from upstream (overwrite only)"
git push -u origin $BranchName

Write-Host "`n✅ Done!"
Write-Host "Next step: open a PR on GitHub:"
Write-Host "  $BranchName  →  $MainBranch"
