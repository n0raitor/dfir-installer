# PowerShell PostProcess script for kernelNucleus-Kernel-DBX of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernelNucleus-Kernel-DBX") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelNucleus-Kernel-DBX" -ItemType SymbolicLink -Target "C:\DFIR\kernelNucleus-Kernel-DBX" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernelNucleus-Kernel-DBX"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelNucleus-Kernel-DBX.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernelNucleus-Kernel-DBX\kernelNucleus-Kernel-DBX.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

