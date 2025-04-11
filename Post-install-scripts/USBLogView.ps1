# PowerShell PostProcess script for USBLogView of Category C:\DFIR\_Tools\USB Forensics

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\USB Forensics")) {
    New-Item -Path "C:\DFIR\_Tools\USB Forensics" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\USBLogView") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\USB Forensics\USBLogView.lnk" -ItemType SymbolicLink -Target "C:\DFIR\USBLogView" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\USBLogView"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\USB Forensics\USBLogView.lnk" -ItemType SymbolicLink -Target "C:\DFIR\USBLogView\USBLogView.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\USB Forensics"

