# PowerShell PostProcess script for SamSpade of Category C:\DFIR\_Tools\Network

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Network")) {
    New-Item -Path "C:\DFIR\_Tools\Network" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\SamSpade") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Network\SamSpade" -ItemType SymbolicLink -Target "C:\DFIR\SamSpade" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\SamSpade"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Network\SamSpade.exe" -ItemType SymbolicLink -Target "C:\DFIR\SamSpade\SamSpade.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Network"

