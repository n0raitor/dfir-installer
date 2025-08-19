# PowerShell PostProcess script for Mandiant_IOCe of Category C:\DFIR\_Tools\IOC Scanner

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\IOC Scanner")) {
    New-Item -Path "C:\DFIR\_Tools\IOC Scanner" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Mandiant_IOCe") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\IOC Scanner\Mandiant_IOCe" -ItemType SymbolicLink -Target "C:\DFIR\Mandiant_IOCe" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Mandiant_IOCe"
}

Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! "
Write-Host "IMPORTANT: Please run the Mandiant IOCe Installer tool from \C:\DFIR\_tmp\Mandiant_IOCe due to it is not possible to spawn it automatically."
Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! "

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\IOC Scanner\Mandiant_IOCe.exe" -ItemType SymbolicLink -Target "C:\DFIR\Mandiant_IOCe\Mandiant_IOCe.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\IOC Scanner"

