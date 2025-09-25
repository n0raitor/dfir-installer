# PowerShell PostProcess script for Comae-Toolkit of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Comae-Toolkit") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\Comae-Toolkit" -ItemType SymbolicLink -Target "C:\DFIR\Comae-Toolkit" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Comae-Toolkit"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\Comae-Toolkit.exe" -ItemType SymbolicLink -Target "C:\DFIR\Comae-Toolkit\Comae-Toolkit.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"

