# PowerShell PostProcess script for MFTBrowser of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\MFTBrowser") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\MFTBrowser" -ItemType SymbolicLink -Target "C:\DFIR\MFTBrowser" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\MFTBrowser"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\MFTBrowser" -ItemType SymbolicLink -Target "C:\DFIR\MFTBrowser\MFTBrowser.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

