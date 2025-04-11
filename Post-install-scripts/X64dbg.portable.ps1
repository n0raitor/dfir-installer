# PowerShell PostProcess script for X64dbg.portable of Category C:\DFIR\_Tools\Debugger

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Debugger")) {
    New-Item -Path "C:\DFIR\_Tools\Debugger" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\X64dbg.portable") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Debugger\X64dbg.portable.lnk" -ItemType SymbolicLink -Target "C:\DFIR\X64dbg.portable" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\X64dbg.portable"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Debugger\X64dbg.portable.lnk" -ItemType SymbolicLink -Target "C:\DFIR\X64dbg.portable\X64dbg.portable.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Debugger"

