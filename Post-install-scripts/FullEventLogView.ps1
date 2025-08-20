# PowerShell PostProcess script for FullEventLogView of Category C:\DFIR\_Tools\Event Log Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Event Log Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\FullEventLogView") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools\FullEventLogView" -ItemType SymbolicLink -Target "C:\DFIR\FullEventLogView" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\FullEventLogView"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Event Log Tools\FullEventLogView" -ItemType SymbolicLink -Target "C:\DFIR\FullEventLogView\FullEventLogView.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Event Log Tools"

