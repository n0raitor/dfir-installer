# PowerShell PostProcess script for WinDbg of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\WinDbg") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Debugger\WinDbg.lnk" -ItemType SymbolicLink -Target "C:\DFIR\WinDbg" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\WinDbg"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\WinDbg.lnk" -ItemType SymbolicLink -Target "C:\DFIR\WinDbg\WinDbg.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

