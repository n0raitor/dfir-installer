# PowerShell PostProcess script for Mandiant IOCe of Category C:\DFIR\_Tools\IOC Scanner

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\IOC Scanner")) {
    New-Item -Path "C:\DFIR\_Tools\IOC Scanner" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Mandiant IOCe") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\IOC Scanner\Mandiant IOCe.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Mandiant IOCe" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Mandiant IOCe"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\IOC Scanner\Mandiant IOCe.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Mandiant IOCe\Mandiant IOCe.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\IOC Scanner"

