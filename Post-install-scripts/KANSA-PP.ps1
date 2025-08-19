# PowerShell PostProcess script for KANSA-PP of Category C:\DFIR\_Tools\Custom

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Custom")) {
    New-Item -Path "C:\DFIR\_Tools\Custom" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\KANSA-PP") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Custom\KANSA-PP" -ItemType SymbolicLink -Target "C:\DFIR\KANSA-PP" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\KANSA-PP"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Custom\KANSA-PP" -ItemType SymbolicLink -Target "C:\DFIR\KANSA-PP\KANSA-PP.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Custom"

