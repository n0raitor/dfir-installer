# PowerShell PostProcess script for forensicsim of Category C:\DFIR\_Tools\Browser Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Browser Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Browser Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\forensicsim") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Browser Tools\forensicsim.lnk" -ItemType SymbolicLink -Target "C:\DFIR\forensicsim" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\forensicsim"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Browser Tools\forensicsim.lnk" -ItemType SymbolicLink -Target "C:\DFIR\forensicsim\forensicsim.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Browser Tools"

