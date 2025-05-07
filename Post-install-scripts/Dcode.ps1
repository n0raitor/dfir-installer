# PowerShell PostProcess script for Dcode of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files (x86)\Digital Detective\DCode v5\DCode.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\DCode.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Dcode.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Dcode\Dcode.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

