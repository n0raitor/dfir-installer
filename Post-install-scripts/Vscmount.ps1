# PowerShell PostProcess script for Vscmount of Category C:\DFIR\_Tools\Acquisition Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Acquisition Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Acquisition Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\VSCMount.exe"
$destinationLnk = "C:\DFIR\_Tools\Acquisition Tools\VSCMount.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Acquisition Tools\Vscmount.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Vscmount\Vscmount.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Acquisition Tools"

