# PowerShell PostProcess script for VisioViewer of Category C:\DFIR\_Tools\Office

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Office")) {
    New-Item -Path "C:\DFIR\_Tools\Office" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VisioViewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Office\VisioViewer" -ItemType SymbolicLink -Target "C:\DFIR\VisioViewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VisioViewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Office\VisioViewer" -ItemType SymbolicLink -Target "C:\DFIR\VisioViewer\VisioViewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Office"

