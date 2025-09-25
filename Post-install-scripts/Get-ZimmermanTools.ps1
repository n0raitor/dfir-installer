# PowerShell PostProcess script for Get-ZimmermanTools of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Zimmerman\") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\Zimmerman" -ItemType SymbolicLink -Target "C:\DFIR\Zimmerman\" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Zimmerman\"
}

$packageName =  "Get-Zimmerman Tools"
# Simulated process
$filePath = "C:\DFIR\Zimmerman\Get-ZimmermanTools.ps1"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    C:\DFIR\Zimmerman\Get-ZimmermanTools.ps1 -Dest C:\DFIR\Zimmerman
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
}

# Check if the tool directory exists
$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\TimelineExplorer\TimelineExplorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\TimelineExplorer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\ShellBagsExplorer\ShellBagsExplorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\ShellBagsExplorer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\SDBExplorer\SDBExplorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\SDBExplorer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\RegistryExplorer\RegistryExplorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\RegistryExplorer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\MFTExplorer\MFTExplorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\MFTExplorer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\JumpListExplorer\JumpListExplorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\JumpListExplorer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\iisGeolocate\iisGeolocate.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\iisGeolocate.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

$sourceLnk = "C:\DFIR\_Tools\_DFIR\Zimmerman\net9\EZViewer\EZViewer.exe"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\EZViewer.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\Get-ZimmermanTools" -ItemType SymbolicLink -Target "C:\DFIR\Get-ZimmermanTools\Get-ZimmermanTools.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"
Write-Host "Install DotNet Dependencies for Zimmerman GUI Tools"
winget install Microsoft.DotNet.DesktopRuntime.9
winget install Microsoft.DotNet.SDK.9
Write-Host "Zimmerman Tool Dependencies Installed"