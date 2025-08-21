param (
    [string]$config
)

#
# STATIC GLOBAL VARS
#
# The configuration for installation directories.
$CURRENTDATETIME = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$LOGFILE2 = "C:\DFIR\DFIR-Install-LogFileInstallLogs_$CURRENTDATETIME.txt"

$INSTALL_DIRECTORY = "C:\DFIR\"
$TEMP_DIRECTORY = "C:\DFIR\_tmp"
# The folder in which shortcuts are stored.The configuration for installation directories
$LNK_FOLDER = "C:\DFIR\_Tools\"

# Timer used for manual MSI installations.
$MAN_INSTALL_MSI_TIMER = 10

# The path to the flag file indicating setup has run.
$flagPath = "C:\DFIR\DFIR-Installer.flag"

# Pfade zu den Konfigurationsordnern
$configDir = "Configs"
$installerConfigDir = "Installer-Configs"
 # Lade die ausgewählte Konfigurationsdatei
$configFile = Join-Path $configDir "$config.conf"

# Path Var Config
$pathvarconfig = "path-var.conf"

#Post Instrallation Scripot Folder
$pp_script_folder = "Post-install-scripts"




###############################
### Functions #################
###############################

# Funktion zur Abfrage der Benutzereingabe
function AskForUpdate {
    param (
        [string]$config
    )
    if ($config -eq "test") {
        Write-Host "Automatisch mit 'Nein' beantwortet, da $config gleich 'test' ist."
        return $false
    }
    
    $response = Read-Host "Möchten Sie die Pakete aktualisieren? (y/n)"
    
    switch ($response.ToLower()) {
        "y" {
            Write-Host "Update wird durchgeführt..."
            return $true
        }
        "n" {
            Write-Host "Kein Update durchgeführt."
            return $false
        }
        default {
            Write-Host "Ungültige Eingabe, bitte 'y' für Ja oder 'n' für Nein eingeben."
            return AskForUpdate  # Rekursiver Aufruf bei ungültiger Eingabe
        }
    }
}
function Install-Program-From-Msi {
    param (
        [string]$ProgramName,  # The name of the program to display in logs
        [string]$MsiPath       # The full path to the MSI file
    )

    # Check if the MSI file exists
    if (-Not (Test-Path -Path $MsiPath)) {
        Write-Error "The MSI file does not exist at the specified path: $MsiPath"
        return
    }

    # Build the msiexec command
    $msiexecCommand = $MsiPath

    # Print out the full command in debug mode before executing it
    Write-Debug "Executing command: $msiexecCommand"

    # Try to start the installer and wait for it to complete
    try {
        Write-Host "$ProgramName : $MsiPath"
        
        # Start the installer with msiexec (without /quiet or /norestart)
        $process = Start-Process -FilePath $MsiPath -ArgumentList "/quiet", "/norestart" -Wait -PassThru
        
        # Wait for the installer to finish (this will be the GUI-based installer now)
        #$process.WaitForExit()

        # Print [OK] once the installation completes
        Write-Host "[OK] Installer Spawned..."
        #Start-Sleep -Seconds 30
        $process.WaitForExit()

    }
    catch {
        Write-Error "An error occurred while installing $ProgramName : $_"
    }
}
function Install-Program-From-Exe {
    param (
        [string]$ProgramName,  # The name of the program to display in logs
        [string]$ExePath       # The full path to the executable file
    )

    # Check if the executable exists
    if (-Not (Test-Path -Path $ExePath)) {
        Write-Error "The executable file does not exist at the specified path: $ExePath"
        return
    }

    # Try to start the installer and wait for it to complete
    try {
        Write-Host "$ProgramName : $ExePath"
        
        # Start the installer in the background and capture the process
        $process = Start-Process -FilePath $ExePath -ArgumentList "/quiet", "/norestart" -Wait -PassThru
        # Wait for the installer to finish
        #$process.WaitForExit()

        # Print [OK] once the installation completes
        Write-Host "[OK] Installer Spawned..."
        $process.WaitForExit()
        # Start-Sleep -Seconds 30
    }
    catch {
        Write-Error "An error occurred while installing $ProgramName : $_"
    }
}
function Download-And-Extract {
    param (
        [string]$url,         # URL to download from
        [string]$destination, # Destination folder
        [string]$runFile      # Optional file to run after extraction (relative path within extracted folder)
    )
    
    # Create the destination folder if it doesn't exist
    Write-Debug "$url -> $destination -> $runFile"
    if (-not (Test-Path -Path $destination)) {
        New-Item -Path $destination -ItemType Directory
    }

    # Download the file
    $fileName = [System.IO.Path]::GetFileName($url)
    $filePath = Join-Path -Path $destination -ChildPath $fileName
    Write-Host "Downloading file from $url to $filePath..."
    $validNames = @("KAPE.zip", "NirSoft-Everything.zip", "ArtiFast.zip", "VMware-workstation-full-17.6.1-24319023.exe", "binaryninja_free_win64.exe", "metasploitframework-latest.msi")
	if ($validNames -contains $fileName) {
		Start-BitsTransfer -Source $url -Destination $filePath
	} else {
		Invoke-WebRequest -Uri $url -OutFile $filePath -UseBasicParsing
	}

    # Extract the file if it's a ZIP or 7z file
    if ($fileName.EndsWith(".zip")) {
        Write-Host "Extracting ZIP file..."
        & 'C:\Program Files\7-Zip\7z.exe' x $filePath "-o$destination" -y
        #Delete Archive
        Remove-Item $filePath -Force
    } elseif ($fileName.EndsWith(".7z")) {
        Write-Host "Extracting 7z file..."
        # Assuming 7zip is installed and its path is available in the system's PATH environment variable
        if ($filePath -match "merlin") {
            & 'C:\Program Files\7-Zip\7z.exe' x $filePath "-o$destination" -pmerlin -y
        } else {
            & 'C:\Program Files\7-Zip\7z.exe' x $filePath "-o$destination" -y
        }
        #Delete Archive
        Remove-Item $filePath -Force
    } elseif ($fileName.EndsWith(".tgz") -or $fileName.EndsWith(".tar.gz")) {
        Write-Host "Extracting TGZ or TAR.GZ file..."
        # Assuming tar is available in the system
        tar -xzf $filePath -C $destination
        #Delete Archive
        Remove-Item $filePath -Force
    } else {
        Write-Host "No extraction needed for file type: $fileName"
    }

    Write-Debug "$runFile"

    # If a runFile was provided, try to run it
    if ($runFile) {
        $runFilePath = Join-Path -Path $destination -ChildPath $runFile
        if (Test-Path $runFilePath) {
            Write-Host "Running $runFilePath..."
            #& $runFilePath
            Write-Host "Manuelle Installation mit Befehl: $runFilePath"
            if ($runFilePath.EndsWith(".msi"))
            {   
                Write-Host "Installing: $runFilePath"
                #Start-Process "$_" | Out-Null
                #Start-Sleep $MAN_INSTALL_MSI_TIMER
                Install-Program-From-Msi -ProgramName "Manual Install MSI" -MsiPath "$runFilePath"       #".\Binaries\wsl_update_x64.msi"
            }
            else {
                Write-Host "Installing: $runFilePath"
                #& "$_" | Out-Null
                #Write-Host "INSTALLED"
                Install-Program-From-Exe -ProgramName "Manual Install" -ExePath "$runFilePath" 
            }      
        } else {
            #Write-Host "The file to run '$runFile' does not exist in the extracted folder."
            Write-Host "Running $runFilePath..."
            & $runFilePath
        }
    }
}
function Process-GitHub-ConfigFile {
    param (
        [string]$configFilePath
    )

    # Read each line from the config file
    $lines = Get-Content -Path $configFilePath

    foreach ($line in $lines) {

        if ($line.Trim().StartsWith("#")) {
            #Write-Host "Skipping comment line: $repo"
            continue
        }
        # Split the line by space to get URL, Destination, and optional runFile
        $parts = $line -split '\s+'
        $packageName = $parts[0]
        $url = $packageName

        if ($url -match "/([^/]+)/archive") {
            $url = $matches[1]
        }

        

        
        if ($parts.Length -ge 2) {
            $url = $parts[0]
            $destination = $parts[1]
            $runFile = if ($parts.Length -gt 2) { $parts[2] } else { $null }
            Write-Debug "url: $url, destination: $destination, runFile: $runFile"
            # Call Download-And-Extract with the parameters
            Download-And-Extract -url $url -destination $destination -runFile $runFile
        } else {
            Write-Debug "Invalid line in config file: $line"
        }
    }
}
function Install-FromConfigFile {
    param (
        [string]$configFilePath,    # Path to the configuration file containing repo details
        [string]$parentFolder       # Parent folder to save the release
    )

    # Check if the configuration file exists
    if (-not (Test-Path $configFilePath)) {
        Write-Host "Configuration file not found at $configFilePath"
        return
    }

    # Read the content of the config file
    $repos = Get-Content -Path $configFilePath

    # Iterate over each line in the configuration file
    foreach ($repo in $repos) {
        # Skip lines that start with "#" (comment lines)
        if ($repo.Trim().StartsWith("#")) {
            #Write-Host "Skipping comment line: $repo"
            continue
        }

        # Split the line into parts (repo and optional script)
        $repoParts = $repo.Split(" ")

        # Validate repo format
        if ($repoParts.Length -ge 1) {
            $repoDetails = $repoParts[0].Split("/")
            if ($repoDetails.Length -eq 2) {
                $githubRepoOwner = $repoDetails[0]
                $githubRepoName = $repoDetails[1]

                # Check if an install script was provided
                $installScriptName = if ($repoParts.Length -gt 1) { $repoParts[1] } else { $null }

                Write-Host "Processing $githubRepoOwner/$githubRepoName"

                # Call the Install-GitHubRelease function to install the release
                Install-GitHubRelease -githubRepoOwner $githubRepoOwner -githubRepoName $githubRepoName -installScriptName $installScriptName -parentFolder $parentFolder
            } else {
                Write-Host "Invalid entry in config file: $repo. Skipping..."
            }
        } else {
            Write-Host "Invalid entry in config file: $repo. Skipping..."
        }
    }
}
function init-setup {
    param (
        [string]$Usern
    )
    New-Item -Path "c:\" -Name "DFIR" -ItemType "directory"
    New-Item -Path "c:\DFIR" -Name "_Tools" -ItemType "directory"
    #New-Item -Path "c:\DFIR" -Name "_GitHub" -ItemType "directory"
    New-Item -ItemType SymbolicLink -Path "C:\Users\$Usern\Desktop\Tools" -Target "C:\DFIR\_Tools"
    #New-Item -ItemType SymbolicLink -Path "C:\DFIR\_Tools\_GitHub" -Target "C:\DFIR\_GitHub"
    New-Item -ItemType SymbolicLink -Path "C:\DFIR\_Tools\_DFIR" -Target "C:\DFIR"
    New-Item -ItemType SymbolicLink -Path "C:\DFIR\_Tools\_choco-bin" -Target "C:\ProgramData\chocolatey\bin"
    New-Item -ItemType SymbolicLink -Path "C:\DFIR\_Tools\_choco-lib" -Target "C:\ProgramData\chocolatey\lib"
       
    # Create the flag file indicating setup has run
    New-Item -Path "C:\DFIR\DFIR-Installer.flag" -ItemType File -Force

    Write-Host ""
}
function post-processing {
    param (
        [string]$Usern
    )

    $packageName = "Cleanup"
    $dirs = "C:\DFIR\_Tools\"
    $currentUserPath = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
    $newPath = $currentUserPath + ";" + ($dirs -join ";")
    [Environment]::SetEnvironmentVariable("PATH", $newPath, [System.EnvironmentVariableTarget]::User)

    $Desktop_Pfad = [System.Environment]::GetFolderPath("Desktop")
    $Ziel_Pfad = "C:\Users\$Usern\Desktop\Tools"
    Write-Output $Desktop_Pfad
    Write-Output $Ziel_Pfad
    Write-Output $(Get-ChildItem -Path $Desktop_Pfad -Filter *.lnk)
    Get-ChildItem -Path $Desktop_Pfad -Filter *.lnk | Move-Item -Destination $Ziel_Pfad
    Get-ChildItem -Path $Desktop_Pfad -Filter *.LNK | Move-Item -Destination $Ziel_Pfad

    # Copy update script to desktop
    $currentDir = Get-Location
    $sourceFile = "$currentDir\update-system.ps1"
    Copy-Item -Path $sourceFile -Destination $Desktop_Pfad

    # Enable detailed context menu
    reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

    # Verschiebe alle Desktop icons in den Ordner Tools
    # Definiere den Desktop-Pfad und den Zielordner
    $desktopPath = [System.Environment]::GetFolderPath('Desktop')
    $targetFolder = "C:\DFIR\_Tools"

    # Überprüfen, ob der Zielordner existiert, andernfalls erstellen
    if (-not (Test-Path $targetFolder)) {
        New-Item -Path $targetFolder -ItemType Directory
        Write-Host "Zielordner wurde erstellt: $targetFolder"
    }

    # Hole alle Dateien auf dem Desktop (ohne Unterordner), außer .txt-Dateien
    $files = Get-ChildItem -Path $desktopPath -File | Where-Object { $_.Extension -ne '.txt' }

    # Verschiebe jede Datei in den Zielordner
    foreach ($file in $files) {
        $destinationPath = Join-Path -Path $targetFolder -ChildPath $file.Name
        Move-Item -Path $file.FullName -Destination $destinationPath -Force
        Write-Host "Datei verschoben: $($file.Name)"
    }

    $targetPath = "C:\Users\$Usern\AppData\Local\Microsoft\WinGet\Links"
    $linkPath = "C:\DFIR\_Tools\_winget-packages"

    if (Test-Path -Path $targetPath) {
        if (-not (Test-Path -Path $linkPath)) {
            New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath
            Write-Host "Symbolic link created."
        } else {
            Write-Host "Link path already exists: $linkPath"
        }
    } else {
        Write-Host "Target path does not exist: $targetPath"
    }


    # ### Create Powershell Admin Prompt LNK
    # # Define the directory and shortcut name
    # $ShortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "PowerShell Admin Prompt")
    # # Create a new WScript.Shell COM object
    # $WScriptShell = New-Object -ComObject WScript.Shell
    # # Create a shortcut object
    # $Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
    # # Set the target path to the PowerShell executable
    # $Shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    # # Set the arguments to start PowerShell as an administrator
    # $Shortcut.Arguments = ""
    # # Set the working directory
    # $Shortcut.WorkingDirectory = "C:\Windows\System32\WindowsPowerShell\v1.0"
    # # Set the window style (1 for normal window)
    # $Shortcut.WindowStyle = 1
    # # Set a description for the shortcut
    # $Shortcut.Description = "PowerShell Admin Prompt"
    # # Optionally, set an icon for the shortcut
    # $Shortcut.IconLocation = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    # # Save the shortcut
    # $Shortcut.Save()
    # Write-Host "PS Admin Prompt Shortcut Created"
}
function copy-documents {
    param (
        [string]$Usern
    )
    Write-Host "Copy Documents and Templates..."
    $cpy_documents_location = ".\Documents\"

    # Definiere den Zielpfad mit der Benutzer-Variable
    $destinationPath = "C:\Users\$Usern\Documents"

    # Stelle sicher, dass der Zielordner existiert
    if (-Not (Test-Path -Path $destinationPath)) {
        Write-Host "Der Zielordner existiert nicht: $destinationPath"
        Write-Host "Skipping..."
    } else {
        # Erhalte alle Ordner im Quellverzeichnis
        $folders = Get-ChildItem -Path $cpy_documents_location -Directory
        Write-Debug "Copy $folders"

        # Verschiebe jeden Ordner in das Zielverzeichnis
        foreach ($folder in $folders) {
            Write-Debug "Folder: $folder"
            $sourceFolderPath = $folder.FullName
            $destinationFolderPath = Join-Path -Path $destinationPath -ChildPath $folder.Name
            
            try {
                Copy-Item -Path $sourceFolderPath -Destination $destinationFolderPath -Recurse -Force
                Write-Host "Erfolgreich verschoben: $($folder.Name)"
            } catch {
                Write-Host "Fehler beim Verschieben von: $($folder.Name) - $($_.Exception.Message)"
            }
        }
    }
}
function post-install-fixes {

    $packageName =  "Post Installation Fixes"

    ##### Updating Script
    if ($config -ne "Testing") {
        $packageName =  "Updating Packages"
        .\update-system.ps1
    }
}
function install-winget {
    param (
        [string]$command,
        [string]$toolname
    )
    Write-Host "Installing $toolname" -NoNewline

    $wingetCommand = "winget install --id $command --silent --accept-package-agreements"

    if ($PSDebugPreference -eq 'Continue') {
        Write-Debug "Führe aus: $wingetCommand"
        Invoke-Expression $wingetCommand
    } else {
        Invoke-Expression "$wingetCommand" *>> $LOGFILE2
    }

    $installed = winget list --id $command | Select-String $command

    if ($installed) {
        Write-Host " [OK]"
    } else {
        Write-Host " [FAILED]"
    }
    
    #winget install --id $command --silent --accept-package-agreements
    # --ignore-security-hash (If the hash is not correct)
    # Füge hier den Winget Installationsbefehl ein
}
function install-choco {
    param (
        [string]$command,
        [string]$toolname
    )
    Write-Host "Installing $toolname" -NoNewline

    # Run choco install, logging output to $LOGFILE2 if not debugging
    if ($PSDebugPreference -eq 'Continue') {
        Write-Debug "Führe aus: choco install $command -y --ignore-checksums"
        choco install $command -y --ignore-checksums
    } else {
        choco install $command -y --ignore-checksums *>> $LOGFILE2
    }

    # Check if package installed by querying choco list
    $installed = choco list --exact $command | Select-String "$command"
    if ($installed) {
        Write-Host " [OK]"
    } else {
        Write-Host " [FAILED]"
    }

    # Füge hier den Choco Installationsbefehl ein
}
function install-copy {
    param (
        [string]$command,
        [string]$toolname
    )
    Write-Host "Datei kopieren mit Befehl: $command"
    
    $Inputstring = $command
    $CharArray = $InputString.Split(" ")
    $Path_To_Portable = $CharArray[0]
    $Path_To_EXE = $CharArray[1]
    $Name_of_LNK = $CharArray[2]
    Write-Host "Installing: $Path_To_EXE"
    Write-Host "Path: $Path_To_Portable"
    Write-Host "LNK-NAME: $Name_of_LNK"
    $Copy_Path = $INSTALL_DIRECTORY + $Name_of_LNK
    Write-Output $Path_To_Portable
    Write-Output $Copy_Path
    Copy-Item -Path $Path_To_Portable -Destination $Copy_Path -Recurse
    #& "$_" | Out-Null
    $LNK_IN = $INSTALL_DIRECTORY + $Name_of_LNK + "\" + $Path_To_EXE
    $LNK_OUT = $LNK_FOLDER + $Name_of_LNK      # + ""
    New-Item -ItemType SymbolicLink -Path $LNK_OUT -Target $LNK_IN
    Write-Host "INSTALLED"
}
function install-manual {
    param (
        [string]$command,
        [string]$toolname
    )

   <#  Write-Host "Manuelle Installation mit Befehl: $command"
    if ($command.EndsWith(".msi"))
    {   
        Write-Host "Installing: $command"
        #Start-Process "$_" | Out-Null
        #Start-Sleep $MAN_INSTALL_MSI_TIMER
        Install-Program-From-Msi -ProgramName "Manual Install MSI" -MsiPath "$command"       #".\Binaries\wsl_update_x64.msi"
    }
    else {
        Write-Host "Installing: $command"
        #& "$_" | Out-Null
        #Write-Host "INSTALLED"
        Install-Program-From-Exe -ProgramName "Manual Install" -ExePath "$command" 
    }       #>
    $parts = $command -split '\s+'
    $packageName = $parts[0]
    $url = $packageName
    $binary = $parts[1]
    Write-Debug "url: $url, destination: $TEMP_DIRECTORY, runFile: $binary"
    # Call Download-And-Extract with the parameters
    Download-And-Extract -url $url -destination $TEMP_DIRECTORY -runFile $binary
}
function install-github {
    param (
        [string]$command,
        [string]$toolname
    )
    Write-Host "Installing $toolname" -NoNewline

    Write-Debug "Github Installation mit Befehl: $command"
    # Split the line by space to get URL, Destination, and optional runFile
    $parts = $command -split '\s+'
    $packageName = $parts[0]
    $url = $packageName

    if ($url -match "/([^/]+)/archive") {
        $url = $matches[1]
    }

    if ($parts.Length -ge 2) {
        $url = $parts[0]
        $destination = $parts[1]
        $runFile = if ($parts.Length -gt 2) { $parts[2] } else { $null }
        Write-Debug "url: $url, destination: $destination, runFile: $runFile"
        # Call Download-And-Extract with the parameters
        Download-And-Extract -url $url -destination $destination -runFile $runFile
        Write-Host "$destination""
    } else {
        Write-Debug "Invalid line in config file: $line"
    }
}
function path-var-config-import {

    # Prüfen, ob die Datei existiert
    if (Test-Path $pathvarconfig) {
        # Aktuelle PATH-Variable holen
        $CurrentPath = [System.Environment]::GetEnvironmentVariable("PATH", "Process")

        # Pfade aus der Datei lesen und hinzufügen
        Get-Content $pathvarconfig | ForEach-Object {
            $NewPath = $_.Trim()
            
            if (!(Test-Path $NewPath)) {
                Write-Host "Pfad nicht gefunden: $NewPath" -ForegroundColor Yellow
            }
            elseif ($CurrentPath -notmatch [regex]::Escape($NewPath)) {
                $CurrentPath += ";$NewPath"
            }
        }

        # PATH für die aktuelle Sitzung setzen
        [System.Environment]::SetEnvironmentVariable("PATH", $CurrentPath, "Process")

        Write-Host "PATH-Variable aktualisiert!" -ForegroundColor Green
    } else {
        Write-Host "Konfigurationsdatei nicht gefunden: $pathvarconfig" -ForegroundColor Red
    }

    if (!(Test-Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force }
    #notepad $PROFILE  # Öffnet es in Notepad zum Bearbeiten
    [System.Environment]::SetEnvironmentVariable("PATH", $CurrentPath, "User")
}

function Main {
    Write-Host ""
    Write-Host "Welcome to the DFIR-Installer"

    # Test if Configuration file exists
    if (-Not (Test-Path $configFile)) {
        Write-Error "Configuration File: $configFile not found. Please check if your config file is in the Configs folder."
        exit
    }

    # Test condition for User Input and Presetup reminder to user
    if ($config -ne "test") {
        Write-Host ""
        $choco_installed = Read-Host -Prompt "Press [Enter] if you followed every prepare step described in the README.md"
        $Usern = Read-Host "Enter your user name (For Symbolic Links on the Desktop):"
        Write-Host ""
    } else {
        $Usern = "NormanSchmidt"
    }

    ### Ask if Choco is already installed
    Write-Debug "Make sure that Chocolatey is installed"

    ### Logging ###
    # Define log file path with current date and time
    $logFilePath = "C:\Users\$Usern\Desktop\DFIR-Install-LogFile_$CURRENTDATETIME.txt"
    #DEPRECATED 

    # Start logging
    Start-Transcript -Path $logFilePath
    ### Use this For Logging Output of CMDs
    #| Tee-Object -FilePath $logFilePath -Append
    # Message to be displayed on screen
    Write-Debug ""
    Write-Debug "Detailed Logging in file $logFilePath."
    Write-Debug ""
    Write-Host "### Starting Installation Phase..."
    ###############################
    # INITIAL SETUP ###############
    ###############################
    # Check if the flag file exists (DFIR-Installer Has Run)
    if (Test-Path $flagPath) {
        Write-Host "##################################################"
        Write-Host "Installer has already run. Skipping INIT Setup..."
        Write-Host "##################################################"
    } else {
        Write-Host "Initial Setup..."
        init-setup $Usern
    }
    

    ###############################
    # 7z installer  ###############
    ###############################
    install-winget "7zip.7zip" "7-Zip"

    ###############################
    # INSTALLATION ###############
    ###############################
    # Lese alle Zeilen der Konfigurationsdatei
    $configLines = Get-Content $configFile

    # Manual Installer Command will get executed at the end
    $manualInstallCommands = @()

    # Gesamtanzahl der Zeilen
    $totalLines = $configLines.Count
    Write-Host "##################################################"
    Write-Host "$totalLines Tools will get installed:"
    # Initialisiere den Zähler
    $counter = 0

    # Gehe jede Zeile durch, um den Tool-Namen zu finden
    foreach ($line in $configLines) {
        # Berechne den Fortschritt
        
        $percentComplete = ($counter / $totalLines) * 100
        Write-Progress -PercentComplete $percentComplete -Status "Verarbeite Zeile $counter von $totalLines" -Activity "Installing Tools"

        $toolName = $line.Trim()
        if ([string]::IsNullOrEmpty($toolName)) {
            continue
        }

        # Suche in den Installer-Konfigurationsdateien nach dem Tool-Namen
        $toolFoundFiles = Get-ChildItem -Path $installerConfigDir -Filter "*.conf" | Where-Object {
            (Select-String -Path $_.FullName -Pattern "^$toolName\s*\|" -Quiet)
        }

        if ($installerConfig.Name -ne "Manual.conf") {
            $counter++
        }

        if ($toolFoundFiles.Count -eq 1) {
            # Führe die entsprechende Installationsfunktion aus
            $installerConfig = $toolFoundFiles[0]
            $commandLine = (Select-String -Path $installerConfig.FullName -Pattern "^$toolName\s*\|" | ForEach-Object { $_.Line.Trim() }).Split("|")[1].Trim()
            Write-Debug "Installing $toolName with command: $commandLine"
            # Je nach Installer-Konfiguration rufe die passende Funktion auf
            if ($installerConfig.Name -eq "Winget.conf") {
                install-winget $commandLine $toolName
            } elseif ($installerConfig.Name -eq "Choco.conf") {
                install-choco $commandLine $toolName
            } elseif ($installerConfig.Name -eq "Copy.conf") {
                install-copy $commandLine $toolName
            } elseif ($installerConfig.Name -eq "Manual.conf") {
                # Füge den Befehl zur manuellen Installation hinzu
                Write-Host "Installing $toolName [SKIPPING FOR MANUAL INSTALL LATER]"
                $manualInstallCommands += $commandLine
            } elseif ($installerConfig.Name -eq "Github.conf") {
                install-github $commandLine $toolName
            }
        } elseif ($toolFoundFiles.Count -eq 0) {
            Write-Error "Kein Tool namens '$toolName' in den Installer-Konfigurationsdateien gefunden."
        } else {
            Write-Error "Mehr als eine Übereinstimmung für Tool '$toolName' gefunden. Bitte überprüfen Sie die Konfigurationsdateien."
        }

        # Überprüfen und Ausführen eines Skripts im Ordner "$pp_script_folder"
        $postInstallScriptPath = "$pp_script_folder\$toolName.ps1"
        #Write-Host "Post-Install-Script: $postInstallScriptPath"
        if (Test-Path $postInstallScriptPath) {
            Write-Host "Running post-install script for $toolName..."
            try {
                & $postInstallScriptPath $Usern
            } catch {
                Write-Error "Failed to execute post-install script $postInstallScriptPath : $_"
            }
        } else {
            Write-Host "No post-install script found for $toolName."
        }

        # Fortschrittsanzeige aktualisieren
        Write-Host ""
    }

    # Execute all collected manual install commands
    foreach ($commandLine in $manualInstallCommands) {
        Write-Host "Installing Manual $commandLine"
        # Start a new job for each manual installation
        install-manual $commandLine
        $counter++
    }

    Write-Progress -PercentComplete 100 -Status "Fertig!" -Activity "Verarbeitung abgeschlossen"
    Read-Host -Prompt "Press [Enter] if every installer windows that were spawned were closed (Installed)"

    post-processing $Usern

    copy-documents $Usern

    # Beispiel für den Wert von $config
    # Aufruf der Funktion und Ergebnis speichern
    $shouldUpdate = AskForUpdate $config

    #update-zimmermann DEPRECTATED and transfered to Post-Installation Fixes

    # Weiterer Code, um das Update basierend auf $shouldUpdate durchzuführen
    if ($shouldUpdate) {
        Write-Host "Das Update wird nun gestartet..."
        post-install-fixes
    } else {
        Write-Host "Kein Update erforderlich."
    }

    # Set Path Var
    path-var-config-import
    
    

    #####################
    #### TODO WSL #######
    #####################

    Write-Host ""
    ### Logging Ended
    # Message to be displayed on screen
    Write-Host "Detailed Logging was written to $logFilePath."

    # Stop logging
    Stop-Transcript

    Write-Host "Das Skript führt nun einige Aufgaben aus..."
}

# Aufruf der Main-Methode am Ende des Skripts
Write-Host @"
____________ ___________     _____          _        _ _           
|  _  \  ___|_   _| ___ \   |_   _|        | |      | | |          
| | | | |_    | | | |_/ /_____| | _ __  ___| |_ __ _| | | ___ _ __ 
| | | |  _|   | | |    /______| || '_ \/ __| __/ _` | | |/ _ \ '__|
| |/ /| |    _| |_| |\ \     _| || | | \__ \ || (_| | | |  __/ |   
|___/ \_|    \___/\_| \_|    \___/_| |_|___/\__\__,_|_|_|\___|_|   
                                                                   
"@

Main



