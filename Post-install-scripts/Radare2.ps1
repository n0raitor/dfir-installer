# PowerShell PostProcess script for Radare2 of Category C:\DFIR\_Tools\Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\Utilities" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Radare2") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Utilities\Radare2.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Radare2" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Radare2"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Utilities\Radare2.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Radare2\Radare2.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Utilities"

