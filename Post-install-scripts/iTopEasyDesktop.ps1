# PowerShell PostProcess script for iTopEasyDesktop of Category C:\DFIR\_Tools\Recommended

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Recommended")) {
    New-Item -Path "C:\DFIR\_Tools\Recommended" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\iTopEasyDesktop") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Recommended\iTopEasyDesktop" -ItemType SymbolicLink -Target "C:\DFIR\iTopEasyDesktop" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\iTopEasyDesktop"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Recommended\iTopEasyDesktop" -ItemType SymbolicLink -Target "C:\DFIR\iTopEasyDesktop\iTopEasyDesktop.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Recommended"

