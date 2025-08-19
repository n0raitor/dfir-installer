# PowerShell PostProcess script for edb-debugger of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\edb-debugger") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Debugger\edb-debugger" -ItemType SymbolicLink -Target "C:\DFIR\edb-debugger" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\edb-debugger"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\edb-debugger" -ItemType SymbolicLink -Target "C:\DFIR\edb-debugger\edb-debugger.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

