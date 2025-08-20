# PowerShell PostProcess script for JavaDecompilerGUI of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\JavaDecompilerGUI") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\SRE\JavaDecompilerGUI" -ItemType SymbolicLink -Target "C:\DFIR\JavaDecompilerGUI" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\JavaDecompilerGUI"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\JavaDecompilerGUI" -ItemType SymbolicLink -Target "C:\DFIR\JavaDecompilerGUI\JavaDecompilerGUI.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

