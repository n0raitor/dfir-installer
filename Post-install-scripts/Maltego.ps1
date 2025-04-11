# PowerShell PostProcess script for Maltego of Category C:\DFIR\_Tools\Inteligence

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Inteligence")) {
    New-Item -Path "C:\DFIR\_Tools\Inteligence" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Maltego") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Inteligence\Maltego.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Maltego" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Maltego"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Inteligence\Maltego.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Maltego\Maltego.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Inteligence"

