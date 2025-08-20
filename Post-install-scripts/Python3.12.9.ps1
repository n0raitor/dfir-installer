# PowerShell PostProcess script for Python3.12.9 of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Python3.12.9") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\Python3.12.9" -ItemType SymbolicLink -Target "C:\DFIR\Python3.12.9" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Python3.12.9"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\Python3.12.9" -ItemType SymbolicLink -Target "C:\DFIR\Python3.12.9\Python3.12.9.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

