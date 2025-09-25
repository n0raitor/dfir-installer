# PowerShell PostProcess script for kernel-vmdk-recovery-demo of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernel-vmdk-recovery-demo") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-vmdk-recovery-demo" -ItemType SymbolicLink -Target "C:\DFIR\kernel-vmdk-recovery-demo" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernel-vmdk-recovery-demo"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernel-vmdk-recovery-demo.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernel-vmdk-recovery-demo\kernel-vmdk-recovery-demo.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

