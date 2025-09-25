# PowerShell PostProcess script for kernel-sql-viewer of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernel-sql-viewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-sql-viewer" -ItemType SymbolicLink -Target "C:\DFIR\kernel-sql-viewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernel-sql-viewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-sql-viewer.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernel-sql-viewer\kernel-sql-viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

