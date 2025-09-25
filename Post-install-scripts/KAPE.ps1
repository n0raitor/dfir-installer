# PowerShell PostProcess script for KAPE of Category C:\DFIR\_Tools\Acquisition Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Acquisition Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Acquisition Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\KAPE") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Acquisition Tools\KAPE" -ItemType SymbolicLink -Target "C:\DFIR\KAPE" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\KAPE"
}

$filePath = "C:\DFIR\KAPE\KAPE\kape.exe"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    C:\DFIR\KAPE\KAPE\kape.exe --sync
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
}

$filePath = "C:\DFIR\KAPE\KAPE\Get-KAPEUpdate.ps1"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    C:\DFIR\KAPE\KAPE\Get-KAPEUpdate.ps1
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
}

# Check if the tool directory exists
$sourceLnk = "C:\DFIR\KAPE\KAPE\gkape.exe"
$destinationLnk = "C:\DFIR\_Tools\Acquisition Tools\gkape.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Check if the tool directory exists
$sourceLnk = "C:\DFIR\KAPE\KAPE\kape.exe"
$destinationLnk = "C:\DFIR\_Tools\Acquisition Tools\kape.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Acquisition Tools\KAPE" -ItemType SymbolicLink -Target "C:\DFIR\KAPE\KAPE.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Acquisition Tools"

