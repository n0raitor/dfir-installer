# PowerShell PostProcess script for Mailviewer of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\CoolUtils\CoolUtils Mail Viewer\MailViewer.exe"
$destinationLnk = "C:\DFIR\_Tools\Email Tools\MailViewer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\Mailviewer" -ItemType SymbolicLink -Target "C:\DFIR\Mailviewer\Mailviewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

