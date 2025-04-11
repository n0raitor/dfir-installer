# PowerShell PostProcess script for Regshot of Category C:\DFIR\_Tools\Registry Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Registry Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Registry Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Regshot") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Registry Tools\Regshot.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Regshot" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Regshot"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Registry Tools\Regshot.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Regshot\Regshot.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Registry Tools"

