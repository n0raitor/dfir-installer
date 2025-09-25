# PowerShell PostProcess script for kernel-document-viewer of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernel-document-viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-document-viewer" -ItemType SymbolicLink -Target "C:\DFIR\kernel-document-viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernel-document-viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-document-viewer.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernel-document-viewer\kernel-document-viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

