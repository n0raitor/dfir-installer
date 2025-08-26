# PowerShell PostProcess script for Cmder of Category C:\DFIR\_Tools\Terminal

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Terminal")) {
    New-Item -Path "C:\DFIR\_Tools\Terminal" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\tools\Cmder\Cmder.exe"
$destinationLnk = "C:\DFIR\_Tools\Terminal\Cmder.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Terminal\Cmder" -ItemType SymbolicLink -Target "C:\DFIR\Cmder\Cmder.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Terminal"

