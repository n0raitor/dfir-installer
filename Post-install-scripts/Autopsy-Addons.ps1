# PowerShell PostProcess script for Autopsy-Addons of Category C:\DFIR\_Tools\Forensic Suits

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Forensic Suits")) {
    New-Item -Path "C:\DFIR\_Tools\Forensic Suits" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Autopsy-Addons") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Forensic Suits\Autopsy-Addons" -ItemType SymbolicLink -Target "C:\DFIR\Autopsy-Addons" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Autopsy-Addons"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Forensic Suits\Autopsy-Addons" -ItemType SymbolicLink -Target "C:\DFIR\Autopsy-Addons\Autopsy-Addons.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Forensic Suits"

