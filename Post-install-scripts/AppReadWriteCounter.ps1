# PowerShell PostProcess script for AppReadWriteCounter of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\AppReadWriteCounter") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\AppReadWriteCounter" -ItemType SymbolicLink -Target "C:\DFIR\AppReadWriteCounter" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\AppReadWriteCounter"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\AppReadWriteCounter" -ItemType SymbolicLink -Target "C:\DFIR\AppReadWriteCounter\AppReadWriteCounter.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

