# PowerShell PostProcess script for kerneloetonotes of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kerneloetonotes") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kerneloetonotes" -ItemType SymbolicLink -Target "C:\DFIR\kerneloetonotes" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kerneloetonotes"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kerneloetonotes.exe" -ItemType SymbolicLink -Target "C:\DFIR\kerneloetonotes\kerneloetonotes.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

