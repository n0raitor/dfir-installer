# PowerShell PostProcess script for PowerShell of Category C:\DFIR\_Tools\Recommended

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Recommended")) {
    New-Item -Path "C:\DFIR\_Tools\Recommended" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\PowerShell") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Recommended\PowerShell" -ItemType SymbolicLink -Target "C:\DFIR\PowerShell" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\PowerShell"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Recommended\PowerShell" -ItemType SymbolicLink -Target "C:\DFIR\PowerShell\PowerShell.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Recommended"

