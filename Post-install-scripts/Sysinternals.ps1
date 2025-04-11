# PowerShell PostProcess script for Sysinternals of Category C:\DFIR\_Tools\System Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\System Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\System Utilities" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Sysinternals") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\System Utilities\Sysinternals.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Sysinternals" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Sysinternals"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\System Utilities\Sysinternals.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Sysinternals\Sysinternals.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\System Utilities"

