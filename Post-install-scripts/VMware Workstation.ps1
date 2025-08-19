# PowerShell PostProcess script for VMware Workstation of Category C:\DFIR\_Tools\VM

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\VM")) {
    New-Item -Path "C:\DFIR\_Tools\VM" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VMware Workstation") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\VM\VMware Workstation" -ItemType SymbolicLink -Target "C:\DFIR\VMware Workstation" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VMware Workstation"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\VM\VMware Workstation" -ItemType SymbolicLink -Target "C:\DFIR\VMware Workstation\VMware Workstation.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\VM"

