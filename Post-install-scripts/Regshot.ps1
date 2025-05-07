# PowerShell PostProcess script for Regshot of Category C:\DFIR\_Tools\Registry Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Registry Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Registry Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\Regshot-x64-ANSI.exe"
$destinationLnk = "C:\DFIR\_Tools\Registry Tools\Regshot-x64-ANSI.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Registry Tools\Regshot.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Regshot\Regshot.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Registry Tools"

