# PowerShell PostProcess script for Testdisk of Category C:\DFIR\_Tools\Carving

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Carving")) {
    New-Item -Path "C:\DFIR\_Tools\Carving" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Testdisk") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Carving\Testdisk.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Testdisk" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Testdisk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Carving\Testdisk.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Testdisk\Testdisk.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Carving"

