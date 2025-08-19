# PowerShell PostProcess script for ReCsvEdit of Category C:\DFIR\_Tools\Editors

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Editors")) {
    New-Item -Path "C:\DFIR\_Tools\Editors" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\ReCsvEdit") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Editors\ReCsvEdit" -ItemType SymbolicLink -Target "C:\DFIR\ReCsvEdit" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\ReCsvEdit"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Editors\ReCsvEdit" -ItemType SymbolicLink -Target "C:\DFIR\ReCsvEdit\ReCsvEdit.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Editors"

