# PowerShell PostProcess script for HasleoDataRecovery of Category C:\DFIR\_Tools\Carving

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Carving")) {
    New-Item -Path "C:\DFIR\_Tools\Carving" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\HasleoDataRecovery") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Carving\HasleoDataRecovery" -ItemType SymbolicLink -Target "C:\DFIR\HasleoDataRecovery" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\HasleoDataRecovery"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Carving\HasleoDataRecovery.exe" -ItemType SymbolicLink -Target "C:\DFIR\HasleoDataRecovery\HasleoDataRecovery.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Carving"

