# PowerShell PostProcess script for DesktopRuntime6 of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\DesktopRuntime6") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\DesktopRuntime6" -ItemType SymbolicLink -Target "C:\DFIR\DesktopRuntime6" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\DesktopRuntime6"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\DesktopRuntime6" -ItemType SymbolicLink -Target "C:\DFIR\DesktopRuntime6\DesktopRuntime6.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

