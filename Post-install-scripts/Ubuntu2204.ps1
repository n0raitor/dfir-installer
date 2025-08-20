# PowerShell PostProcess script for Ubuntu2204 of Category C:\DFIR\_Tools\Linux

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Linux")) {
    New-Item -Path "C:\DFIR\_Tools\Linux" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Ubuntu2204") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Linux\Ubuntu2204" -ItemType SymbolicLink -Target "C:\DFIR\Ubuntu2204" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Ubuntu2204"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Linux\Ubuntu2204" -ItemType SymbolicLink -Target "C:\DFIR\Ubuntu2204\Ubuntu2204.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Linux"

