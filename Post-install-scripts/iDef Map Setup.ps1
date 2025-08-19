# PowerShell PostProcess script for iDef Map Setup of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\iDef Map Setup") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\iDef Map Setup" -ItemType SymbolicLink -Target "C:\DFIR\iDef Map Setup" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\iDef Map Setup"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\iDef Map Setup" -ItemType SymbolicLink -Target "C:\DFIR\iDef Map Setup\iDef Map Setup.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"

