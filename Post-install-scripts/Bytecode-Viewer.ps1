# PowerShell PostProcess script for Bytecode-Viewer of Category C:\DFIR\_Tools\Editors

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Editors")) {
    New-Item -Path "C:\DFIR\_Tools\Editors" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Bytecode-Viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Editors\Bytecode-Viewer" -ItemType SymbolicLink -Target "C:\DFIR\Bytecode-Viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Bytecode-Viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Editors\Bytecode-Viewer" -ItemType SymbolicLink -Target "C:\DFIR\Bytecode-Viewer\Bytecode-Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Editors"

