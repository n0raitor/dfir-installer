# PowerShell PostProcess script for Chromagnon of Category C:\DFIR\_Tools\Browser Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Browser Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Browser Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Chromagnon") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Browser Tools\Chromagnon" -ItemType SymbolicLink -Target "C:\DFIR\Chromagnon" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Chromagnon"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Browser Tools\Chromagnon" -ItemType SymbolicLink -Target "C:\DFIR\Chromagnon\Chromagnon.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Browser Tools"

