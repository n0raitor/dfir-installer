# PowerShell PostProcess script for sort-PhotorecRecoveredFiles of Category C:\DFIR\_Tools\Carving

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Carving")) {
    New-Item -Path "C:\DFIR\_Tools\Carving" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\sort-PhotorecRecoveredFiles") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Carving\sort-PhotorecRecoveredFiles" -ItemType SymbolicLink -Target "C:\DFIR\sort-PhotorecRecoveredFiles" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\sort-PhotorecRecoveredFiles"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Carving\sort-PhotorecRecoveredFiles" -ItemType SymbolicLink -Target "C:\DFIR\sort-PhotorecRecoveredFiles\sort-PhotorecRecoveredFiles.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Carving"

