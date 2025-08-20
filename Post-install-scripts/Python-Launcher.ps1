# PowerShell PostProcess script for Python-Launcher of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Python-Launcher") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\Python-Launcher" -ItemType SymbolicLink -Target "C:\DFIR\Python-Launcher" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Python-Launcher"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\Python-Launcher" -ItemType SymbolicLink -Target "C:\DFIR\Python-Launcher\Python-Launcher.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

