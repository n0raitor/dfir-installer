# PowerShell PostProcess script for Npcap of Category C:\DFIR\_Tools\Network

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Network")) {
    New-Item -Path "C:\DFIR\_Tools\Network" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Npcap") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Network\Npcap" -ItemType SymbolicLink -Target "C:\DFIR\Npcap" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Npcap"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Network\Npcap" -ItemType SymbolicLink -Target "C:\DFIR\Npcap\Npcap.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Network"

