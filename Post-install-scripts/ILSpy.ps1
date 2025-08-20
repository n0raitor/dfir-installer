# PowerShell PostProcess script for ILSpy of Category C:\DFIR\_Tools\Utilities

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Utilities")) {
    New-Item -Path "C:\DFIR\_Tools\Utilities" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\ILSpy") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Utilities\ILSpy" -ItemType SymbolicLink -Target "C:\DFIR\ILSpy" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\ILSpy"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Utilities\ILSpy" -ItemType SymbolicLink -Target "C:\DFIR\ILSpy\ILSpy.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Utilities"

