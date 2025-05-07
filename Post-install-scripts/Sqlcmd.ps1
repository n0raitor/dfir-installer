# PowerShell PostProcess script for Sqlcmd of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\SqlCmd\sqlcmd.exe"
$destinationLnk = "C:\DFIR\_Tools\Other\sqlcmd.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\Sqlcmd.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Sqlcmd\Sqlcmd.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

