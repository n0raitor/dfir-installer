# PowerShell PostProcess script for kernelNucleus-Kernel-Excel of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernelNucleus-Kernel-Excel") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelNucleus-Kernel-Excel" -ItemType SymbolicLink -Target "C:\DFIR\kernelNucleus-Kernel-Excel" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernelNucleus-Kernel-Excel"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelNucleus-Kernel-Excel.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernelNucleus-Kernel-Excel\kernelNucleus-Kernel-Excel.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

