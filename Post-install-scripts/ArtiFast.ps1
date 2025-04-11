# PowerShell PostProcess script for ArtiFast of Category C:\DFIR\_Tools\Forensic Suits

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Forensic Suits")) {
    New-Item -Path "C:\DFIR\_Tools\Forensic Suits" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\ArtiFast") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Forensic Suits\ArtiFast.lnk" -ItemType SymbolicLink -Target "C:\DFIR\ArtiFast" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\ArtiFast"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Forensic Suits\ArtiFast.lnk" -ItemType SymbolicLink -Target "C:\DFIR\ArtiFast\ArtiFast.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Forensic Suits"

