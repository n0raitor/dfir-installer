# PowerShell PostProcess script for google-fs-recover of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\google-fs-recover") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\google-fs-recover" -ItemType SymbolicLink -Target "C:\DFIR\google-fs-recover" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\google-fs-recover"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\google-fs-recover" -ItemType SymbolicLink -Target "C:\DFIR\google-fs-recover\google-fs-recover.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

