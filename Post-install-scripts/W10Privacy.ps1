# PowerShell PostProcess script for W10Privacy of Category C:\DFIR\_Tools\System Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\System Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\System Utilities" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\W10Privacy") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\System Utilities\W10Privacy" -ItemType SymbolicLink -Target "C:\DFIR\W10Privacy" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\W10Privacy"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\System Utilities\W10Privacy.exe" -ItemType SymbolicLink -Target "C:\DFIR\W10Privacy\W10Privacy.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\System Utilities"

