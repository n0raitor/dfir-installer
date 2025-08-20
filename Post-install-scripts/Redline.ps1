# PowerShell PostProcess script for Redline of Category C:\DFIR\_Tools\Forensic Suits

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Forensic Suits")) {
    New-Item -Path "C:\DFIR\_Tools\Forensic Suits" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Redline") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Forensic Suits\Redline" -ItemType SymbolicLink -Target "C:\DFIR\Redline" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Redline"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Forensic Suits\Redline" -ItemType SymbolicLink -Target "C:\DFIR\Redline\Redline.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Forensic Suits"

