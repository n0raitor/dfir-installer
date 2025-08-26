# PowerShell PostProcess script for Maltego of Category C:\DFIR\_Tools\Inteligence

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Inteligence")) {
    New-Item -Path "C:\DFIR\_Tools\Inteligence" -ItemType Directory
}

# Check if the tool directory exists
$maltegoRoot = "C:\Program Files (x86)\Paterva\Maltego"
$exeName = "maltego.exe"

# Recursively search for maltego.exe within Maltego directory
$sourceLnk = Get-ChildItem -Path $maltegoRoot -Recurse -Filter $exeName -File -ErrorAction SilentlyContinue | 
    Sort-Object -Property LastWriteTime -Descending |
    Select-Object -First 1

if ($sourceLnk) {
    Write-Host "Found Maltego executable at: $($sourceLnk.FullName)"
} else {
    Write-Host "Maltego executable not found."
}

if ($sourceLnk) {
    $destinationLnk = "C:\DFIR\_Tools\Inteligence\Maltego.exe"

    if (Test-Path -Path $sourceLnk) {
        # Copy the  file if it exists
        New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
    } else {
        Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
    }
} else {
    Write-Host "Maltego executable not found, using Directory: $maltegoRoot to create the symlink manually."
    New-Item -Path "C:\DFIR\_Tools\Inteligence\Maltego" -ItemType SymbolicLink -Target "C:\Program Files (x86)\Paterva\Maltego" -Force

}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Inteligence\Maltego" -ItemType SymbolicLink -Target "C:\DFIR\Maltego\Maltego.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Inteligence"

