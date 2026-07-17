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

  [switch] $Junction,

  [switch] $WireIncludes
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

function Wire-Include {
  param(
    [string] $IniName,
    [string] $IncludeLine
  )
  $target = Join-Path $GameDir $IniName
  if (-not (Test-Path $target)) {
    Write-Host "Skip wire: $IniName not found"
    return
  }
  $content = Get-Content -LiteralPath $target -Raw
  if ($content -like "*$IncludeLine*") {
    Write-Host "Already wired: $IniName"
    return
  }
  $bak = "$target.bak"
  if (-not (Test-Path $bak)) {
    Copy-Item -LiteralPath $target -Destination $bak
    Write-Host "Backup: $IniName.bak"
  }
  Add-Content -LiteralPath $target -Value "`r`n; RA2 Enhanced — added by install-mod.ps1`r`n$IncludeLine`r`n"
  Write-Host "Wired: $IniName"
}

if ($WireIncludes) {
  Wire-Include -IniName "rulesmd.ini" -IncludeLine "#include Mods/ra2-enhanced/includes/rulesmd.includes.ini"
  Wire-Include -IniName "aimd.ini" -IncludeLine "#include Mods/ra2-enhanced/includes/aimd.includes.ini"
  Wire-Include -IniName "uimd.ini" -IncludeLine "#include Mods/ra2-enhanced/includes/uimd.includes.ini"
}

# Write outside the mod tree so -Junction does not pollute the git repo
$steps = Join-Path $GameDir "Mods\RA2-Enhanced-INSTALL-NEXT-STEPS.txt"
@"
RA2 Enhanced — next steps
=========================

Installed to: $Dst

1) Install Ares + Phobos into: $GameDir
2) Activate overlays with -WireIncludes or manual #include (see docs/install.md)
3) Merge Mods\ra2-enhanced\qol\ra2md-phobos.ini into RA2MD.INI
4) Launch via Syringe / CnCNet

This script did NOT install game files or engine DLLs.
"@ | Set-Content -LiteralPath $steps -Encoding UTF8

Write-Host ""
Write-Host "Next steps:"
Write-Host "  1) Install Ares + Phobos into: $GameDir"
Write-Host "  2) Re-run with -WireIncludes (or merge includes manually)"
Write-Host "  3) Merge qol\ra2md-phobos.ini into RA2MD.INI"
Write-Host "  4) Launch via Syringe or CnCNet (not bare gamemd if using Ares)"
Write-Host "  Details: $steps"
Write-Host ""
Write-Host "This script did NOT install game files or engine DLLs."
