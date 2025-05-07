# PowerShell PostProcess script for FiddlerClassic of Category C:\DFIR\_Tools\Network

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Network")) {
    New-Item -Path "C:\DFIR\_Tools\Network" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Users\N0\AppData\Local\Programs\Fiddler\Fiddler.exe"
$destinationLnk = "C:\DFIR\_Tools\Network\Fiddler.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Network\FiddlerClassic.lnk" -ItemType SymbolicLink -Target "C:\DFIR\FiddlerClassic\FiddlerClassic.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Network"

