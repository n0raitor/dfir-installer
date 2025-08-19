# PowerShell PostProcess script for RegRipper3.0 of Category C:\DFIR\_Tools\Registry Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Registry Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Registry Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\RegRipper3.0") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Registry Tools\RegRipper3.0" -ItemType SymbolicLink -Target "C:\DFIR\RegRipper3.0" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\RegRipper3.0"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Registry Tools\RegRipper3.0" -ItemType SymbolicLink -Target "C:\DFIR\RegRipper3.0\RegRipper3.0.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Registry Tools"

