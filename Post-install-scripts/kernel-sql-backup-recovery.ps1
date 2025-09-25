# PowerShell PostProcess script for kernel-sql-backup-recovery of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernel-sql-backup-recovery") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-sql-backup-recovery" -ItemType SymbolicLink -Target "C:\DFIR\kernel-sql-backup-recovery" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernel-sql-backup-recovery"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-sql-backup-recovery.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernel-sql-backup-recovery\kernel-sql-backup-recovery.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

