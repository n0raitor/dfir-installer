# PowerShell PostProcess script for Ppee of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}
# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\PPEE.exe"
$destinationLnk = "C:\DFIR\_Tools\Other\PPEE.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\Ppee" -ItemType SymbolicLink -Target "C:\DFIR\Ppee\Ppee.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

