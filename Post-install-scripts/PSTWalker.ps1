# PowerShell PostProcess script for PSTWalker of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\PSTWalker") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Email Tools\PSTWalker" -ItemType SymbolicLink -Target "C:\DFIR\PSTWalker" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\PSTWalker"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\PSTWalker" -ItemType SymbolicLink -Target "C:\DFIR\PSTWalker\PSTWalker.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

