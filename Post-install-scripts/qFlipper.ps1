# PowerShell PostProcess script for qFlipper of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\qFlipper") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\qFlipper" -ItemType SymbolicLink -Target "C:\DFIR\qFlipper" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\qFlipper"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\qFlipper" -ItemType SymbolicLink -Target "C:\DFIR\qFlipper\qFlipper.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

