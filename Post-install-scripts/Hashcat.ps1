# PowerShell PostProcess script for Hashcat of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Hashcat") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\Hashcat.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Hashcat" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Hashcat"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\Hashcat.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Hashcat\Hashcat.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

