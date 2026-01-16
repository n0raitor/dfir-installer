$folder = 'C:\DFIR\_dfir-installer'

#winget update
Write-Host "Updating System Script is running..."

### Update Zimmermann
# Pfad zur Datei definieren
Write-Host "Starting Zimmerman Tools Update"
$filePath = "C:\DFIR\Zimmerman\Get-ZimmermanTools.ps1"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    C:\DFIR\Zimmerman\Get-ZimmermanTools.ps1 -Dest C:\DFIR\Zimmerman
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
} else {
	Write-Host "$filePath does not exist. Skipping..."
}

$filePath = "C:\DFIR\KAPE\KAPE\Get-KAPEUpdate.ps1"

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    C:\DFIR\KAPE\KAPE\Get-KAPEUpdate.ps1
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
} else {
	Write-Host "$filePath does not exist. Skipping..."
}

# Überprüfen, ob die Datei existiert
if (Test-Path $filePath) {
    # Datei existiert, daher ausführen
    Write-Host "$filePath existiert. Skript wird ausgeführt..."
    C:\DFIR\KAPE\KAPE\kape.exe --sync
    #Move-Item -Path ".\net9" -Destination "C:\DFIR\Zimmerman\" -Force
} else {
	Write-Host "$filePath does not exist. Skipping..."
}


Write-Host "Starting: Winget Upgrade"
winget update
winget upgrade --all --include-unknown

Write-Host "Starting: Chocolatey upgrade"
choco upgrade all -y



Write-Host "Starting: Export Configs"

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

Read-Host "Make sure to move unused Links that were dropped during the update to the Tools folder on your desktop. Press Enter to continue with the DFIR-Installer Check"

# Output the path where the file was saved
Write-Host "Export completed. File saved to: $exportFile"

if (Test-Path -Path $folder -PathType Container) {
    Write-Host "dfir-installer exists at: $folder" -ForegroundColor Green
    $userInput = Read-Host "The folder 'C:\DFIR\_dfir-installer' already exists.  Do you want to update the installer? [y/N] "
    if ($userInput.Trim().ToUpper().StartsWith('Y')) {
        Write-Host "Updating dfir-installer..."
        Set-Location 'C:\DFIR\_dfir-installer'
        .\Get-dfir-installer-Update.ps1
        $userInput = Read-Host "Do you want to run the installer? [y/N] "
        if ($userInput.Trim().ToUpper().StartsWith('Y')) {
            Write-Host "Running dfir-installer..."
            Set-Location 'C:\DFIR\_dfir-installer\dfir-installer'
            $installerScript = ".\dfir-install.ps1"
            if (Test-Path $installerScript) {
                Write-Host "Running updated dfir-installer... on $installerScript"
                & 'C:\Program Files\PowerShell\7\pwsh.exe' -ExecutionPolicy Bypass $installerScript 
                return
            } else {
                Write-Host "dfir-install.ps1 not found after update!" -ForegroundColor Red
                return
            }
        } else {
            Write-Host "Skipping running dfir-installer" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Skipping Update of dfir-installer" -ForegroundColor Yellow
    } 
} else {
    Write-Host "DFIR-Installer does not exist at: $folder. Skipping Update of dfir-installer" -ForegroundColor Red
}