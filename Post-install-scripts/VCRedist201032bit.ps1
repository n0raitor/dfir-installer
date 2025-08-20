# PowerShell PostProcess script for VCRedist201032bit of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VCRedist201032bit") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\VCRedist201032bit" -ItemType SymbolicLink -Target "C:\DFIR\VCRedist201032bit" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VCRedist201032bit"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\VCRedist201032bit.exe" -ItemType SymbolicLink -Target "C:\DFIR\VCRedist201032bit\VCRedist201032bit.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

