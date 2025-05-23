# PowerShell PostProcess script for DockerDesktop of Category C:\DFIR\_Tools\Package Manager

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Package Manager")) {
    New-Item -Path "C:\DFIR\_Tools\Package Manager" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\DockerDesktop") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Package Manager\DockerDesktop.lnk" -ItemType SymbolicLink -Target "C:\DFIR\DockerDesktop" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\DockerDesktop"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Package Manager\DockerDesktop.lnk" -ItemType SymbolicLink -Target "C:\DFIR\DockerDesktop\DockerDesktop.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Package Manager"

