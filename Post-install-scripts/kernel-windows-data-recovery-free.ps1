# PowerShell PostProcess script for kernel-windows-data-recovery-free of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernel-windows-data-recovery-free") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-windows-data-recovery-free" -ItemType SymbolicLink -Target "C:\DFIR\kernel-windows-data-recovery-free" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernel-windows-data-recovery-free"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-windows-data-recovery-free.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernel-windows-data-recovery-free\kernel-windows-data-recovery-free.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

