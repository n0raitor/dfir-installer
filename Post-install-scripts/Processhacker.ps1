# PowerShell PostProcess script for Processhacker of Category C:\DFIR\_Tools\System Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\System Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\System Utilities" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\Process Hacker 2\ProcessHacker.exe"
$destinationLnk = "C:\DFIR\_Tools\System Utilities\ProcessHacker.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\System Utilities\Processhacker.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Processhacker\Processhacker.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\System Utilities"

