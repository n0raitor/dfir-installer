# PowerShell PostProcess script for Exchange-edb-viewer of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Exchange-edb-viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Email Tools\Exchange-edb-viewer" -ItemType SymbolicLink -Target "C:\DFIR\Exchange-edb-viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Exchange-edb-viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\Exchange-edb-viewer" -ItemType SymbolicLink -Target "C:\DFIR\Exchange-edb-viewer\Exchange-edb-viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

