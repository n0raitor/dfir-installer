# PowerShell PostProcess script for windump of Category C:\DFIR\_Tools\Volatile

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Volatile")) {
    New-Item -Path "C:\DFIR\_Tools\Volatile" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\windump") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Volatile\windump" -ItemType SymbolicLink -Target "C:\DFIR\windump" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\windump"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Volatile\windump" -ItemType SymbolicLink -Target "C:\DFIR\windump\windump.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Volatile"

