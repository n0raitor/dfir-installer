param(
    [string]$Usern
)

Winget:

$sourceLnk = "C:\Users\N0\AppData\Local\Microsoft\WinGet\Links\Thumbcache Viewer"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\Thumbcache Viewer"

if (Test-Path -Path "C:\Users\N0\AppData\Local\Microsoft\WinGet\Links") {
    if (Test-Path -Path $sourceLnk) {
        # Copy the  file if it exists
        Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
    } else {
        Write-Host "Shortcut not found: $sourceLnk"
    }
} else {
    Write-Host "WinGet packages path does not exist."
}

OR:

# Check if the tool directory exists
$sourceLnk = "\"
$destinationLnk = "C:\DFIR\_Tools\Artif\010Editor"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

Choco:

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\bin\.exe"
$destinationLnk = "C:\DFIR\_Tools\Artif\"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}