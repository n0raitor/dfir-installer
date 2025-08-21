# PowerShell PostProcess script for Structured Storage Viewer of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\StructuredStorageViewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\StructuredStorageViewer" -ItemType SymbolicLink -Target "C:\DFIR\StructuredStorageViewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\StructuredStorageViewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Structured Storage Viewer" -ItemType SymbolicLink -Target "C:\DFIR\Structured Storage Viewer\Structured Storage Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

