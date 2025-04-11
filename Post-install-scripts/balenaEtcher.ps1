# PowerShell PostProcess script for balenaEtcher of Category C:\DFIR\_Tools\Media

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Media")) {
    New-Item -Path "C:\DFIR\_Tools\Media" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\balenaEtcher") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Media\balenaEtcher.lnk" -ItemType SymbolicLink -Target "C:\DFIR\balenaEtcher" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\balenaEtcher"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Media\balenaEtcher.lnk" -ItemType SymbolicLink -Target "C:\DFIR\balenaEtcher\balenaEtcher.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Media"

