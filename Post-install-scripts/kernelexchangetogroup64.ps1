# PowerShell PostProcess script for kernelexchangetogroup64 of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernelexchangetogroup64") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelexchangetogroup64" -ItemType SymbolicLink -Target "C:\DFIR\kernelexchangetogroup64" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernelexchangetogroup64"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelexchangetogroup64.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernelexchangetogroup64\kernelexchangetogroup64.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

