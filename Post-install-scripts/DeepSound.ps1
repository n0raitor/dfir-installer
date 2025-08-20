# PowerShell PostProcess script for DeepSound of Category C:\DFIR\_Tools\Stegano

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Stegano")) {
    New-Item -Path "C:\DFIR\_Tools\Stegano" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\DeepSound") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Stegano\DeepSound" -ItemType SymbolicLink -Target "C:\DFIR\DeepSound" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\DeepSound"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Stegano\DeepSound" -ItemType SymbolicLink -Target "C:\DFIR\DeepSound\DeepSound.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Stegano"

