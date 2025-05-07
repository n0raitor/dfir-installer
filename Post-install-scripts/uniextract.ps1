# PowerShell PostProcess script for uniextract of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files (x86)\Universal Extractor\UniExtract.exe"
$destinationLnk = "C:\DFIR\_Tools\SRE\UniExtract.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\uniextract.lnk" -ItemType SymbolicLink -Target "C:\DFIR\uniextract\uniextract.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

