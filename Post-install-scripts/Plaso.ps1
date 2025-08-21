# PowerShell PostProcess script for Plaso of Category C:\DFIR\_Tools\Post-Processing

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Post-Processing")) {
    New-Item -Path "C:\DFIR\_Tools\Post-Processing" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Plaso") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Post-Processing\Plaso" -ItemType SymbolicLink -Target "C:\DFIR\Plaso" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Plaso"
}

winget install Microsoft.VisualStudio.2022.BuildTools

Write-Host "Install Instruction in your Documents folder in /DFIR-Installer-Optional/InstallationSteps"

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Post-Processing\Plaso" -ItemType SymbolicLink -Target "C:\DFIR\Plaso\Plaso.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Post-Processing"

