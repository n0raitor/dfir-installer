# PowerShell PostProcess script for kernelpstadd of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernelpstadd") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelpstadd" -ItemType SymbolicLink -Target "C:\DFIR\kernelpstadd" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernelpstadd"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelpstadd.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernelpstadd\kernelpstadd.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

