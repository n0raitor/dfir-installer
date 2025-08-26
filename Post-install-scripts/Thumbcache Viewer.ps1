# PowerShell PostProcess script for Thumbcache Viewer of Category C:\DFIR\_Tools\Artifact Tools
param(
    [string]$Usern
)

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

$sourceLnk = "C:\Users\$Usern\AppData\Local\Microsoft\WinGet\Links\Thumbcache Viewer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\Thumbcache Viewer.exe"

if (Test-Path -Path "C:\Users\$Usern\AppData\Local\Microsoft\WinGet\Links") {
    if (Test-Path -Path $sourceLnk) {
        # Copy the  file if it exists
        New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
    } else {
        Write-Host "Shortcut not found: $sourceLnk"
    }
} else {
    Write-Host "WinGet packages path does not exist."
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Thumbcache Viewer" -ItemType SymbolicLink -Target "C:\DFIR\Thumbcache Viewer\Thumbcache Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

