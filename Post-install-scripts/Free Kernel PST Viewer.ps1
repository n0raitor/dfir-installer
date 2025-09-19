# PowerShell PostProcess script for Kernel-PST-Viewer of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Kernel-PST-Viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Email Tools\Kernel-PST-Viewer" -ItemType SymbolicLink -Target "C:\DFIR\Kernel-PST-Viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Kernel-PST-Viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\Kernel-PST-Viewer" -ItemType SymbolicLink -Target "C:\DFIR\Kernel-PST-Viewer\Kernel-PST-Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

