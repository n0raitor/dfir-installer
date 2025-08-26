# PowerShell PostProcess script for Procdump of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}
# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\procdump.exe"
$destinationLnk = "C:\DFIR\_Tools\Debugger\procdump.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\Procdump" -ItemType SymbolicLink -Target "C:\DFIR\Procdump\Procdump.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

