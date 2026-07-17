#Requires -Version 5.1
<#
.SYNOPSIS
  Install RA2 Enhanced INI overlays into a Yuri's Revenge game directory.
.DESCRIPTION
  Copies text-only mod files. Never downloads game binaries or Ares/Phobos.
#>
param(
  [Parameter(Mandatory = $true)]
  [string] $GameDir,

  [switch] $Junction
)

$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$Src = Join-Path $RepoRoot "mod\ra2-enhanced"
$Dst = Join-Path $GameDir "Mods\ra2-enhanced"

if (-not (Test-Path $Src)) {
  throw "Mod source not found: $Src"
}
if (-not (Test-Path $GameDir)) {
  throw "GameDir does not exist: $GameDir"
}

$exe = Join-Path $GameDir "gamemd.exe"
if (-not (Test-Path $exe)) {
  Write-Warning "gamemd.exe not found in GameDir. Continuing anyway (Wine paths sometimes differ)."
}

New-Item -ItemType Directory -Force -Path (Split-Path $Dst) | Out-Null

if (Test-Path $Dst) {
  Write-Host "Removing existing: $Dst"
  Remove-Item -Recurse -Force $Dst
}

if ($Junction) {
  New-Item -ItemType Junction -Path $Dst -Target $Src | Out-Null
  Write-Host "Junction created: $Dst -> $Src"
} else {
  Copy-Item -Recurse -Force $Src $Dst
  Write-Host "Copied overlays to: $Dst"
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "  1) Install Ares + Phobos into: $GameDir"
Write-Host "  2) Merge/include INIs per docs/install.md"
Write-Host "  3) Launch via Syringe or CnCNet (not bare gamemd if using Ares)"
Write-Host ""
Write-Host "This script did NOT install game files or engine DLLs."
