# PowerShell PostProcess script for kerneldrawdemo of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kerneldrawdemo") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kerneldrawdemo" -ItemType SymbolicLink -Target "C:\DFIR\kerneldrawdemo" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kerneldrawdemo"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kerneldrawdemo.exe" -ItemType SymbolicLink -Target "C:\DFIR\kerneldrawdemo\kerneldrawdemo.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

