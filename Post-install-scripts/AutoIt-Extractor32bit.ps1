# PowerShell PostProcess script for AutoIt-Extractor32bit of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\AutoIt-Extractor32bit") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\AutoIt-Extractor32bit" -ItemType SymbolicLink -Target "C:\DFIR\AutoIt-Extractor32bit" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\AutoIt-Extractor32bit"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\AutoIt-Extractor32bit.exe" -ItemType SymbolicLink -Target "C:\DFIR\AutoIt-Extractor32bit\AutoIt-Extractor32bit.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

