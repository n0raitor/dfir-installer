# PowerShell PostProcess script for RegExport of Category C:\DFIR\_Tools\Registry Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Registry Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Registry Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\RegExport") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Registry Tools\RegExport" -ItemType SymbolicLink -Target "C:\DFIR\RegExport" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\RegExport"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Registry Tools\RegExport" -ItemType SymbolicLink -Target "C:\DFIR\RegExport\RegExport.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Registry Tools"

