# PowerShell PostProcess script for MarkText of Category C:\DFIR\_Tools\Editors

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Editors")) {
    New-Item -Path "C:\DFIR\_Tools\Editors" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Users\N0\AppData\Local\Programs\MarkText\MarkText.exe"
$destinationLnk = "C:\DFIR\_Tools\Editors\MarkText.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Editors\MarkText.lnk" -ItemType SymbolicLink -Target "C:\DFIR\MarkText\MarkText.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Editors"

