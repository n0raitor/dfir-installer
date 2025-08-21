# PowerShell PostProcess script for Get-ZimmermanTools of Category C:\DFIR\_Tools\Collections

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Collections")) {
    New-Item -Path "C:\DFIR\_Tools\Collections" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Get-ZimmermanTools") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Collections\Get-ZimmermanTools" -ItemType SymbolicLink -Target "C:\DFIR\Get-ZimmermanTools" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Get-ZimmermanTools"
}

$packageName =  "Get-Zimmerman Tools"
# Simulated process
$filePath = "C:\DFIR\Zimmerman\Get-ZimmermanTools.ps1"

    # Überprüfen, ob die Datei existiert
    if (Test-Path $filePath) {
        # Datei existiert, daher ausführen
        Write-Host "$filePath existiert. Skript wird ausgeführt..."
        . $filePath
        Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
    }

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Collections\Get-ZimmermanTools" -ItemType SymbolicLink -Target "C:\DFIR\Get-ZimmermanTools\Get-ZimmermanTools.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Collections"

