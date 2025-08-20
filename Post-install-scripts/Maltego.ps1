# PowerShell PostProcess script for Maltego of Category C:\DFIR\_Tools\Inteligence

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Inteligence")) {
    New-Item -Path "C:\DFIR\_Tools\Inteligence" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files (x86)\Paterva\Maltego\v4.9.2\bin\maltego.exe"
$destinationLnk = "C:\DFIR\_Tools\Inteligence\Maltego.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Inteligence\Maltego" -ItemType SymbolicLink -Target "C:\DFIR\Maltego\Maltego.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Inteligence"

