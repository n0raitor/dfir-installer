# PowerShell PostProcess script for Free Kernel OST Viewer of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Free Kernel OST Viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Email Tools\Free Kernel OST Viewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Free Kernel OST Viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Free Kernel OST Viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\Free Kernel OST Viewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Free Kernel OST Viewer\Free Kernel OST Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

