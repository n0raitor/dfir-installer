# PowerShell PostProcess script for fqlite of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\fqlite") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\fqlite" -ItemType SymbolicLink -Target "C:\DFIR\fqlite" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\fqlite"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\fqlite" -ItemType SymbolicLink -Target "C:\DFIR\fqlite\fqlite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

