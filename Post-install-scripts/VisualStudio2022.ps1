# PowerShell PostProcess script for VisualStudio2022 of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VisualStudio2022") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\VisualStudio2022" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudio2022" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VisualStudio2022"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\VisualStudio2022" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudio2022\VisualStudio2022.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

