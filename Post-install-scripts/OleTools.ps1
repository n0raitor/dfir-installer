# PowerShell PostProcess script for OleTools of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\OleTools") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\OleTools" -ItemType SymbolicLink -Target "C:\DFIR\OleTools" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\OleTools"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\OleTools" -ItemType SymbolicLink -Target "C:\DFIR\OleTools\OleTools.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"

