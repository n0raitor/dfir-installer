# PowerShell PostProcess script for WindowsTerminal of Category C:\DFIR\_Tools\Recommended

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Recommended")) {
    New-Item -Path "C:\DFIR\_Tools\Recommended" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\WindowsTerminal") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Recommended\WindowsTerminal.lnk" -ItemType SymbolicLink -Target "C:\DFIR\WindowsTerminal" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\WindowsTerminal"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Recommended\WindowsTerminal.lnk" -ItemType SymbolicLink -Target "C:\DFIR\WindowsTerminal\WindowsTerminal.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Recommended"

