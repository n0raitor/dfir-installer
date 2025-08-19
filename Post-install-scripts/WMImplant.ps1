# PowerShell PostProcess script for WMImplant of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\WMImplant") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\WMImplant" -ItemType SymbolicLink -Target "C:\DFIR\WMImplant" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\WMImplant"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\WMImplant" -ItemType SymbolicLink -Target "C:\DFIR\WMImplant\WMImplant.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

