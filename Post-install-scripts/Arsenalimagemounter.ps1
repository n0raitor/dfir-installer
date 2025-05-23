# PowerShell PostProcess script for Arsenalimagemounter of Category C:\DFIR\_Tools\Acquisition Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Acquisition Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Acquisition Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\ArsenalImageMounter.exe"
$destinationLnk = "C:\DFIR\_Tools\Acquisition Tools\ArsenalImageMounter.lnk"

if (Test-Path -Path $sourceLnk) {
    $WshShell = New-Object -ComObject WScript.Shell
    $shortcut = $WshShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $exePath
    $shortcut.WorkingDirectory = Split-Path $exePath
    $shortcut.WindowStyle = 1
    $shortcut.Description = ""
    $shortcut.Save()
    Write-Host "Shortcut created at: $shortcutPath"
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Acquisition Tools\Arsenalimagemounter.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Arsenalimagemounter\Arsenalimagemounter.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Acquisition Tools"

