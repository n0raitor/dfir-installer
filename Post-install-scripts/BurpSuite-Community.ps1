# PowerShell PostProcess script for BurpSuite-Community of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
# Check if the tool directory exists
$sourceLnk = "C:\Program Files\BurpSuiteCommunity\BurpSuiteCommunity.exe"
$destinationLnk = "C:\DFIR\_Tools\Offensive\BurpSuiteCommunity.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\BurpSuite-Community" -ItemType SymbolicLink -Target "C:\DFIR\BurpSuite-Community\BurpSuite-Community.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

