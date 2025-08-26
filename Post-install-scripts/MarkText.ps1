# PowerShell PostProcess script for MarkText of Category C:\DFIR\_Tools\Editors
param(
    [string]$Usern
)

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Editors")) {
    New-Item -Path "C:\DFIR\_Tools\Editors" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Users\$Usern\AppData\Local\Programs\MarkText\MarkText.exe"
$destinationLnk = "C:\DFIR\_Tools\Editors\MarkText.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Editors\MarkText" -ItemType SymbolicLink -Target "C:\DFIR\MarkText\MarkText.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Editors"

