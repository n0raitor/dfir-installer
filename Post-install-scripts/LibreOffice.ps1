# PowerShell PostProcess script for LibreOffice of Category C:\DFIR\_Tools\Office

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Office")) {
    New-Item -Path "C:\DFIR\_Tools\Office" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\LibreOffice\program\soffice.exe"
$destinationLnk = "C:\DFIR\_Tools\Office\LibreOffice.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Office\LibreOffice" -ItemType SymbolicLink -Target "C:\DFIR\LibreOffice\LibreOffice.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Office"

