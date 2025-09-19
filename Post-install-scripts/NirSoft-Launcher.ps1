# PowerShell PostProcess script for AutoIt-Extractor of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\DFIR\NirSoft-Launcher\NirSoft-Launcher\NirLauncher.exe"
$destinationLnk = "C:\DFIR\_Tools\Collections\NirSoft-Launcher.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}