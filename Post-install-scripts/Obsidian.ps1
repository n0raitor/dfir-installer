# PowerShell PostProcess script for Obsidian of Category C:\DFIR\_Tools\Office

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Office")) {
    New-Item -Path "C:\DFIR\_Tools\Office" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Obsidian") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Office\Obsidian" -ItemType SymbolicLink -Target "C:\DFIR\Obsidian" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Obsidian"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Office\Obsidian" -ItemType SymbolicLink -Target "C:\DFIR\Obsidian\Obsidian.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Office"

