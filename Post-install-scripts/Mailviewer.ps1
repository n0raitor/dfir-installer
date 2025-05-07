# PowerShell PostProcess script for Mailviewer of Category C:\DFIR\_Tools\Email Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Email Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Email Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\CoolUtils\CoolUtils Mail Viewer\MailViewer.exe"
$destinationLnk = "C:\DFIR\_Tools\Email Tools\MailViewer.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Email Tools\Mailviewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Mailviewer\Mailviewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Email Tools"

