# PowerShell PostProcess script for kernelmboxviewer of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernelmboxviewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelmboxviewer" -ItemType SymbolicLink -Target "C:\DFIR\kernelmboxviewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernelmboxviewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelmboxviewer.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernelmboxviewer\kernelmboxviewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

