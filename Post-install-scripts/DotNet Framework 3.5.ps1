# PowerShell PostProcess script for DotNet Framework 3.5 of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\DotNet Framework 3.5") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\DotNet Framework 3.5" -ItemType SymbolicLink -Target "C:\DFIR\DotNet Framework 3.5" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\DotNet Framework 3.5"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\DotNet Framework 3.5" -ItemType SymbolicLink -Target "C:\DFIR\DotNet Framework 3.5\DotNet Framework 3.5.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

