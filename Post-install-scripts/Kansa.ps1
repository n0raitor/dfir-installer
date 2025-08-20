# PowerShell PostProcess script for Kansa of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Kansa") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\Kansa" -ItemType SymbolicLink -Target "C:\DFIR\Kansa" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Kansa"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\Kansa" -ItemType SymbolicLink -Target "C:\DFIR\Kansa\Kansa.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

