# PowerShell PostProcess script for AutoIt-Extractor of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\AutoIt-Extractor") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\AutoIt-Extractor" -ItemType SymbolicLink -Target "C:\DFIR\AutoIt-Extractor" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\AutoIt-Extractor"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\AutoIt-Extractor" -ItemType SymbolicLink -Target "C:\DFIR\AutoIt-Extractor\AutoIt-Extractor.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

