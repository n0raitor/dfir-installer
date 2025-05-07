# PowerShell PostProcess script for Upx of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\upx.exe"
$destinationLnk = "C:\DFIR\_Tools\SRE\upx.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\Upx.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Upx\Upx.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

