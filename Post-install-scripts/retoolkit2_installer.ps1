# PowerShell PostProcess script for retoolkit2_installer of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\retoolkit2_installer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\retoolkit2_installer" -ItemType SymbolicLink -Target "C:\DFIR\retoolkit2_installer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\retoolkit2_installer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\retoolkit2_installer" -ItemType SymbolicLink -Target "C:\DFIR\retoolkit2_installer\retoolkit2_installer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"

