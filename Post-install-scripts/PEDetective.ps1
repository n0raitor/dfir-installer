# PowerShell PostProcess script for PEDetective of Category C:\DFIR\_Tools\Malware Analysis

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Malware Analysis")) {
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\PEDetective") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis\PEDetective" -ItemType SymbolicLink -Target "C:\DFIR\PEDetective" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\PEDetective"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Malware Analysis\PEDetective" -ItemType SymbolicLink -Target "C:\DFIR\PEDetective\PEDetective.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Malware Analysis"

