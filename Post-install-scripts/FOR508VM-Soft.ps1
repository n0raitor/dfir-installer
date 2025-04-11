# PowerShell PostProcess script for FOR508VM-Soft of Category C:\DFIR\_Tools\Misc

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Misc")) {
    New-Item -Path "C:\DFIR\_Tools\Misc" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\FOR508VM-Soft") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Misc\FOR508VM-Soft.lnk" -ItemType SymbolicLink -Target "C:\DFIR\FOR508VM-Soft" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\FOR508VM-Soft"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Misc\FOR508VM-Soft.lnk" -ItemType SymbolicLink -Target "C:\DFIR\FOR508VM-Soft\FOR508VM-Soft.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Misc"

