# PowerShell PostProcess script for Scylla of Category C:\DFIR\_Tools\OSINT

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\OSINT")) {
    New-Item -Path "C:\DFIR\_Tools\OSINT" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Scylla") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\OSINT\Scylla" -ItemType SymbolicLink -Target "C:\DFIR\Scylla" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Scylla"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\OSINT\Scylla" -ItemType SymbolicLink -Target "C:\DFIR\Scylla\Scylla.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\OSINT"

