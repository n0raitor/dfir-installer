# PowerShell PostProcess script for BloodHound of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\BloodHound") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\BloodHound" -ItemType SymbolicLink -Target "C:\DFIR\BloodHound" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\BloodHound"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\BloodHound" -ItemType SymbolicLink -Target "C:\DFIR\BloodHound\BloodHound.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

