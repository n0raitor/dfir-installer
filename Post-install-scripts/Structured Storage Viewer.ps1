# PowerShell PostProcess script for Structured Storage Viewer of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Structured Storage Viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Structured Storage Viewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Structured Storage Viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Structured Storage Viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Structured Storage Viewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Structured Storage Viewer\Structured Storage Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

