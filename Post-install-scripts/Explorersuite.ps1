# PowerShell PostProcess script for Explorersuite of Category C:\DFIR\_Tools\Suite

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Suite")) {
    New-Item -Path "C:\DFIR\_Tools\Suite" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\NTCore\Explorer Suite\CFF Explorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Suite\CFF Explorer.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

$sourceLnk = "C:\Program Files\NTCore\Explorer Suite\PE Detective.exe"
$destinationLnk = "C:\DFIR\_Tools\Suite\PE Detective.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

$sourceLnk = "C:\Program Files\NTCore\Explorer Suite\Signature Explorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Suite\Signature Explorer.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}
$sourceLnk = "C:\Program Files\NTCore\Explorer Suite\Task Explorer.exe"
$destinationLnk = "C:\DFIR\_Tools\Suite\Task Explorer.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}
# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Suite\Explorersuite.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Explorersuite\Explorersuite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Suite"

