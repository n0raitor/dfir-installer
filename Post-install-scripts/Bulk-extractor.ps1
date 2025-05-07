# PowerShell PostProcess script for Bulk-extractor of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files (x86)\Bulk Extractor 1.5.5\64-bit\BEViewerLauncher.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\Bulk Extractor GUI.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Bulk-extractor.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Bulk-extractor\Bulk-extractor.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

