# PowerShell PostProcess script for Event Log Explorer of Category C:\DFIR\_Tools\Event Log Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Event Log Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Event Log Explorer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools\Event Log Explorer" -ItemType SymbolicLink -Target "C:\DFIR\Event Log Explorer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Event Log Explorer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Event Log Tools\Event Log Explorer" -ItemType SymbolicLink -Target "C:\DFIR\Event Log Explorer\Event Log Explorer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Event Log Tools"

