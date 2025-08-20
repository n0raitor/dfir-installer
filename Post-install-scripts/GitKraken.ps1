# PowerShell PostProcess script for GitKraken of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\GitKraken") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\GitKraken" -ItemType SymbolicLink -Target "C:\DFIR\GitKraken" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\GitKraken"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\GitKraken" -ItemType SymbolicLink -Target "C:\DFIR\GitKraken\GitKraken.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

