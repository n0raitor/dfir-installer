# PowerShell PostProcess script for Testdisk of Category C:\DFIR\_Tools\Carving

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Carving")) {
    New-Item -Path "C:\DFIR\_Tools\Carving" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\testdisk_win.exe"
$destinationLnk = "C:\DFIR\_Tools\Carving\testdisk_win.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Carving\Testdisk.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Testdisk\Testdisk.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Carving"

