# PowerShell PostProcess script for Radare2 of Category C:\DFIR\_Tools\Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\Utilities" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\radare2.exe"
$destinationLnk = "C:\DFIR\_Tools\Utilities\radare2.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Utilities\Radare2.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Radare2\Radare2.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Utilities"

