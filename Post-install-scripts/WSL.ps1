# PowerShell PostProcess script for WSL of Category C:\DFIR\_Tools\Linux

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Linux")) {
    New-Item -Path "C:\DFIR\_Tools\Linux" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\WSL") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Linux\WSL" -ItemType SymbolicLink -Target "C:\DFIR\WSL" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\WSL"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Linux\WSL" -ItemType SymbolicLink -Target "C:\DFIR\WSL\WSL.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Linux"

