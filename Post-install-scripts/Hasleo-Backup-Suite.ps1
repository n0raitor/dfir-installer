# PowerShell PostProcess script for Hasleo-Backup-Suite of Category C:\DFIR\_Tools\Backup

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Backup")) {
    New-Item -Path "C:\DFIR\_Tools\Backup" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Hasleo-Backup-Suite") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Backup\Hasleo-Backup-Suite.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Hasleo-Backup-Suite" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Hasleo-Backup-Suite"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Backup\Hasleo-Backup-Suite.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Hasleo-Backup-Suite\Hasleo-Backup-Suite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Backup"

