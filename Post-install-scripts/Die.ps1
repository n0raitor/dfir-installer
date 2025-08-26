# PowerShell PostProcess script for Die of Category C:\DFIR\_Tools\Malware Analysis

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Malware Analysis")) {
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\die.exe"
$destinationLnk = "C:\DFIR\_Tools\Malware Analysis\die.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Malware Analysis\Die" -ItemType SymbolicLink -Target "C:\DFIR\Die\Die.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Malware Analysis"

