# PowerShell PostProcess script for Apimonitor of Category C:\DFIR\_Tools\Network

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Network")) {
    New-Item -Path "C:\DFIR\_Tools\Network" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\apimonitor-x64.exe"
$destinationLnk = "C:\DFIR\_Tools\Network\Apimonitor.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Network\Apimonitor" -ItemType SymbolicLink -Target "C:\DFIR\Apimonitor\Apimonitor.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Network"

