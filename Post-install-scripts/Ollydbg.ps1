# PowerShell PostProcess script for Ollydbg of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files (x86)\OllyDbg\OLLYDBG.exe"
$destinationLnk = "C:\DFIR\_Tools\Debugger\OLLYDBG.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\Ollydbg.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Ollydbg\Ollydbg.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

