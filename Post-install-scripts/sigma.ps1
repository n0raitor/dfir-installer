# PowerShell PostProcess script for sigma of Category C:\DFIR\_Tools\IOC Scanner

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\IOC Scanner")) {
    New-Item -Path "C:\DFIR\_Tools\IOC Scanner" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\sigma") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\IOC Scanner\sigma" -ItemType SymbolicLink -Target "C:\DFIR\sigma" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\sigma"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\IOC Scanner\sigma" -ItemType SymbolicLink -Target "C:\DFIR\sigma\sigma.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\IOC Scanner"

