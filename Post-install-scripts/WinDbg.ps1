# PowerShell PostProcess script for WinDbg of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Users\N0\AppData\Local\Microsoft\WindowsApps\Microsoft.WinDbg_8wekyb3d8bbwe\WinDbgX.exe"
$destinationLnk = "C:\DFIR\_Tools\Debugger\WinDbgX.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\WinDbg.lnk" -ItemType SymbolicLink -Target "C:\DFIR\WinDbg\WinDbg.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

