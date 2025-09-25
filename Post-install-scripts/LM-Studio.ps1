# PowerShell PostProcess script for LM-Studio of Category C:\DFIR\_Tools\Misc

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Misc")) {
    New-Item -Path "C:\DFIR\_Tools\Misc" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\LM-Studio") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Misc\LM-Studio" -ItemType SymbolicLink -Target "C:\DFIR\LM-Studio" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\LM-Studio"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Misc\LM-Studio.exe" -ItemType SymbolicLink -Target "C:\DFIR\LM-Studio\LM-Studio.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Misc"

