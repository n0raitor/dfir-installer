# PowerShell PostProcess script for HxD of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}
# Check if the tool directory exists
$sourceLnk = "C:\Program Files\HxD\HxD.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\HxD.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\HxD.lnk" -ItemType SymbolicLink -Target "C:\DFIR\HxD\HxD.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

