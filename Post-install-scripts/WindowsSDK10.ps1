# PowerShell PostProcess script for WindowsSDK10 of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\WindowsSDK10") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\WindowsSDK10" -ItemType SymbolicLink -Target "C:\DFIR\WindowsSDK10" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\WindowsSDK10"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\WindowsSDK10" -ItemType SymbolicLink -Target "C:\DFIR\WindowsSDK10\WindowsSDK10.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

