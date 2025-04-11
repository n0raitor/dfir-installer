# PowerShell PostProcess script for Mailviewer of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Mailviewer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Email Tools\Mailviewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Mailviewer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Mailviewer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\Mailviewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Mailviewer\Mailviewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

