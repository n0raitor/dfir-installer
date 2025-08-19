# PowerShell PostProcess script for MagnetRAMCapture of Category C:\DFIR\_Tools\Acquisition Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Acquisition Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Acquisition Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\MagnetRAMCapture") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Acquisition Tools\MagnetRAMCapture" -ItemType SymbolicLink -Target "C:\DFIR\MagnetRAMCapture" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\MagnetRAMCapture"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Acquisition Tools\MagnetRAMCapture" -ItemType SymbolicLink -Target "C:\DFIR\MagnetRAMCapture\MagnetRAMCapture.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Acquisition Tools"

