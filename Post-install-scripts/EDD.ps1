# PowerShell PostProcess script for EDD of Category C:\DFIR\_Tools\Misc

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Misc")) {
    New-Item -Path "C:\DFIR\_Tools\Misc" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\EDD") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Misc\EDD" -ItemType SymbolicLink -Target "C:\DFIR\EDD" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\EDD"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Misc\EDD.exe" -ItemType SymbolicLink -Target "C:\DFIR\EDD\EDD.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Misc"

