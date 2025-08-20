# PowerShell PostProcess script for Veeam-backup-and-replication-iso of Category C:\DFIR\_Tools\Backup

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Backup")) {
    New-Item -Path "C:\DFIR\_Tools\Backup" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Veeam-backup-and-replication-iso") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Backup\Veeam-backup-and-replication-iso" -ItemType SymbolicLink -Target "C:\DFIR\Veeam-backup-and-replication-iso" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Veeam-backup-and-replication-iso"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Backup\Veeam-backup-and-replication-iso" -ItemType SymbolicLink -Target "C:\DFIR\Veeam-backup-and-replication-iso\Veeam-backup-and-replication-iso.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Backup"

