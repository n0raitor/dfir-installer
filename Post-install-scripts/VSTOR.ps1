# PowerShell PostProcess script for VSTOR of Category C:\DFIR\_Tools\Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\Utilities" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VSTOR") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Utilities\VSTOR" -ItemType SymbolicLink -Target "C:\DFIR\VSTOR" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VSTOR"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Utilities\VSTOR" -ItemType SymbolicLink -Target "C:\DFIR\VSTOR\VSTOR.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Utilities"

