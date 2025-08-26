# PowerShell PostProcess script for Logfileparser of Category C:\DFIR\_Tools\NTFS Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\NTFS Tools")) {
    New-Item -Path "C:\DFIR\_Tools\NTFS Tools" -ItemType Directory
}

# Check if the tool directory exists
# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\LogFileParser.exe"
$destinationLnk = "C:\DFIR\_Tools\NTFS Tools\LogFileParser.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\NTFS Tools\Logfileparser" -ItemType SymbolicLink -Target "C:\DFIR\Logfileparser\Logfileparser.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\NTFS Tools"

