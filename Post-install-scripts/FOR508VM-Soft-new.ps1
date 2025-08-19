# PowerShell PostProcess script for FOR508VM-Soft-new of Category C:\DFIR\_Tools\Misc

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Misc")) {
    New-Item -Path "C:\DFIR\_Tools\Misc" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\FOR508VM-Soft-new") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Misc\FOR508VM-Soft-new" -ItemType SymbolicLink -Target "C:\DFIR\FOR508VM-Soft-new" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\FOR508VM-Soft-new"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Misc\FOR508VM-Soft-new.exe" -ItemType SymbolicLink -Target "C:\DFIR\FOR508VM-Soft-new\FOR508VM-Soft-new.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Misc"

