# PowerShell PostProcess script for kali-windows-binaries of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kali-windows-binaries") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\kali-windows-binaries" -ItemType SymbolicLink -Target "C:\DFIR\kali-windows-binaries" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kali-windows-binaries"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\kali-windows-binaries" -ItemType SymbolicLink -Target "C:\DFIR\kali-windows-binaries\kali-windows-binaries.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

