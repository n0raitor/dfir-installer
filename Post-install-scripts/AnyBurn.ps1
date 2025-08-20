# PowerShell PostProcess script for AnyBurn of Category C:\DFIR\_Tools\Media

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Media")) {
    New-Item -Path "C:\DFIR\_Tools\Media" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\AnyBurn") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Media\AnyBurn" -ItemType SymbolicLink -Target "C:\DFIR\AnyBurn" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\AnyBurn"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Media\AnyBurn" -ItemType SymbolicLink -Target "C:\DFIR\AnyBurn\AnyBurn.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Media"

