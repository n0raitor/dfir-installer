# PowerShell PostProcess script for DidierStevensSuite of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\DidierStevensSuite") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\DidierStevensSuite" -ItemType SymbolicLink -Target "C:\DFIR\DidierStevensSuite" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\DidierStevensSuite"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\DidierStevensSuite" -ItemType SymbolicLink -Target "C:\DFIR\DidierStevensSuite\DidierStevensSuite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"

