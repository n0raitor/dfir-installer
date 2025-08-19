# PowerShell PostProcess script for notatin_dump of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\notatin_dump") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\notatin_dump" -ItemType SymbolicLink -Target "C:\DFIR\notatin_dump" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\notatin_dump"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\notatin_dump" -ItemType SymbolicLink -Target "C:\DFIR\notatin_dump\notatin_dump.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

