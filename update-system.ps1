#$dfirInstallerUrl = "https://github.com/n0raitor/dfir-installer/archive/refs/heads/main.zip"
$dfirInstallerUrl = "https://f003.backblazeb2.com/file/dfir-installer/dfir-installer-main.zip"
$dfirInstallerZip = "C:\DFIR\_dfir-installer\dfir-installer-latest.zip"
$dfirInstallerExtractPath = "C:\DFIR\_dfir-installer"

# Download the latest release zip
Write-Host "Downloading the latest dfir-installer..."
Start-BitsTransfer -Source $dfirInstallerUrl -Destination $dfirInstallerZip

# Remove old files except the zip (optional, be careful if you have custom files)
Get-ChildItem -Path $dfirInstallerExtractPath -Exclude "dfir-installer-latest.zip" | Remove-Item -Recurse -Force

# Extract the new files
Expand-Archive -Path $dfirInstallerZip -DestinationPath $dfirInstallerExtractPath -Force

# Move the extracted content up if needed (GitHub zip usually contains a subfolder)
$extractedFolder = Join-Path $dfirInstallerExtractPath "dfir-installer-main"
#if (Test-Path $extractedFolder) {
#    Get-ChildItem -Path $extractedFolder | Move-Item -Destination $dfirInstallerExtractPath -Force
#    Remove-Item -Path $extractedFolder -Recurse -Force
#}

# Remove the zip file
Remove-Item $dfirInstallerZip -Force
cd C:\DFIR\_dfir-installer\dfir-installer-main\
Write-Host "dfir-installer updated successfully. Running the installer..."
# Run dfir-installer.ps1
$installerScript = ".\dfir-install.ps1"
if (Test-Path $installerScript) {
    Write-Host "Running updated dfir-installer... on $installerScript"
    & 'C:\Program Files\PowerShell\7\pwsh.exe' -ExecutionPolicy Bypass $installerScript 
    return
} else {
    Write-Host "dfir-install.ps1 not found after update!" -ForegroundColor Red
    return
}

#winget update
winget upgrade --all --include-unknown
choco upgrade all -y

### Update Zimmermann
# Pfad zur Datei definieren

$filePath = "C:\DFIR\Zimmerman\Get-ZimmermanTools.ps1"
$command = $filePath + " -Dest C:\DFIR\Zimmerman"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    . $command
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
}

$filePath = "C:\DFIR\KAPE\kape.exe"
$command = $filePath + " --sync" 

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    . $command
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
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

