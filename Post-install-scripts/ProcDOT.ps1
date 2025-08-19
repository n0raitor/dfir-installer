# PowerShell PostProcess script for ProcDOT of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\ProcDOT") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Debugger\ProcDOT" -ItemType SymbolicLink -Target "C:\DFIR\ProcDOT" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\ProcDOT"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\ProcDOT" -ItemType SymbolicLink -Target "C:\DFIR\ProcDOT\ProcDOT.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

