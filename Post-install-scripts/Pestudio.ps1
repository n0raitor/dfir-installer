# PowerShell PostProcess script for Pestudio of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Pestudio") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Pestudio.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Pestudio" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Pestudio"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Pestudio.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Pestudio\Pestudio.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

