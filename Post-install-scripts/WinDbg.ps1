# PowerShell PostProcess script for WinDbg of Category C:\DFIR\_Tools\Debugger
param(
    [string]$Usern
)

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Users\$Usern\AppData\Local\Microsoft\WindowsApps\Microsoft.WinDbg_8wekyb3d8bbwe\WinDbgX.exe"
$destinationLnk = "C:\DFIR\_Tools\Debugger\WinDbgX.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\WinDbg" -ItemType SymbolicLink -Target "C:\DFIR\WinDbg\WinDbg.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

