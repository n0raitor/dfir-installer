# PowerShell PostProcess script for PDF24Creator of Category C:\DFIR\_Tools\Office

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Office")) {
    New-Item -Path "C:\DFIR\_Tools\Office" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\PDF24Creator") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Office\PDF24Creator" -ItemType SymbolicLink -Target "C:\DFIR\PDF24Creator" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\PDF24Creator"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Office\PDF24Creator" -ItemType SymbolicLink -Target "C:\DFIR\PDF24Creator\PDF24Creator.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Office"

