# PowerShell PostProcess script for Explorer Suite of Category C:\DFIR\_Tools\Suite

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Suite")) {
    New-Item -Path "C:\DFIR\_Tools\Suite" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Explorer Suite") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Suite\Explorer Suite" -ItemType SymbolicLink -Target "C:\DFIR\Explorer Suite" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Explorer Suite"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Suite\Explorer Suite" -ItemType SymbolicLink -Target "C:\DFIR\Explorer Suite\Explorer Suite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Suite"

