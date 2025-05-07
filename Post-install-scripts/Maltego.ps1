# PowerShell PostProcess script for Maltego of Category C:\DFIR\_Tools\Inteligence

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Inteligence")) {
    New-Item -Path "C:\DFIR\_Tools\Inteligence" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files (x86)\Paterva\Maltego\v4.9.2\bin\maltego.exe"
$destinationLnk = "C:\DFIR\_Tools\Inteligence\Maltego.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Inteligence\Maltego.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Maltego\Maltego.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Inteligence"

