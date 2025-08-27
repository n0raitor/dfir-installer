#winget update
winget upgrade --all --include-unknown
choco upgrade all -y

### Update Zimmermann
# Pfad zur Datei definieren
$filePath = "C:\DFIR\Get-ZimmermanTools\Get-ZimmermanTools.ps1"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "Get-ZimmermanTools existiert. Skript wird ausgeführt..."
    . $filePath
}


##& chocolateygui.exe
##& "C:\Program Files\UniGetUI\UniGetUI.exe"

#################
# Export Config #
#################
# Get the current date in YYYY-MM-DD format
$currentDate = Get-Date -Format "yyyy-MM-dd"

# Define the path to the Documents folder for the current user
$documentsFolder = [Environment]::GetFolderPath('MyDocuments')

# Define the path to the export folder (Default)
$exportFolder = Join-Path -Path $documentsFolder -ChildPath "Default"

# Create the export folder if it does not exist
if (-not (Test-Path -Path $exportFolder)) {
    New-Item -Path $exportFolder -ItemType Directory
}

# Define the export file name with current date
$exportFile = Join-Path -Path $exportFolder -ChildPath "winget_export_$currentDate.json"
$exportFilechoco = Join-Path -Path $exportFolder -ChildPath "choco_export_$currentDate.config"

# Run the winget export command to export the installed packages list to the file
winget export -o $exportFile
choco export $exportFilechoco

Read-Host "Make sure to move unused Links that were dropped during the update to the Tools folder on your desktop. Press Enter to continue..."

# Output the path where the file was saved
Write-Host "Export completed. File saved to: $exportFile"

