# PowerShell PostProcess script for Event Log Explorer_Forensic of Category C:\DFIR\_Tools\Event Log Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Event Log Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Event Log Explorer_Forensic") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools\Event Log Explorer_Forensic" -ItemType SymbolicLink -Target "C:\DFIR\Event Log Explorer_Forensic" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Event Log Explorer_Forensic"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Event Log Tools\Event Log Explorer_Forensic" -ItemType SymbolicLink -Target "C:\DFIR\Event Log Explorer_Forensic\Event Log Explorer_Forensic.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Event Log Tools"

