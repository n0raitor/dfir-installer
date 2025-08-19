# PowerShell PostProcess script for WindowsInstallationAssistant of Category C:\DFIR\_Tools\Driver

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Driver")) {
    New-Item -Path "C:\DFIR\_Tools\Driver" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\WindowsInstallationAssistant") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Driver\WindowsInstallationAssistant" -ItemType SymbolicLink -Target "C:\DFIR\WindowsInstallationAssistant" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\WindowsInstallationAssistant"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Driver\WindowsInstallationAssistant" -ItemType SymbolicLink -Target "C:\DFIR\WindowsInstallationAssistant\WindowsInstallationAssistant.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Driver"

