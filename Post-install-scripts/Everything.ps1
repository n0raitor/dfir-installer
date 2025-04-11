# PowerShell PostProcess script for Everything of Category C:\DFIR\_Tools\Recommended

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Recommended")) {
    New-Item -Path "C:\DFIR\_Tools\Recommended" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Everything") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Recommended\Everything.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Everything" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Everything"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Recommended\Everything.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Everything\Everything.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Recommended"

