# PowerShell PostProcess script for CrystalDiskInfo of Category C:\DFIR\_Tools\System Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\System Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\System Utilities" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\CrystalDiskInfo\DiskInfo64.exe"
$destinationLnk = "C:\DFIR\_Tools\System Utilities\CrystalDiskInfo.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\System Utilities\CrystalDiskInfo" -ItemType SymbolicLink -Target "C:\DFIR\CrystalDiskInfo\CrystalDiskInfo.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\System Utilities"

