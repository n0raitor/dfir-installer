# PowerShell PostProcess script for ExtremeDumper of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\ExtremeDumper") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\SRE\ExtremeDumper.lnk" -ItemType SymbolicLink -Target "C:\DFIR\ExtremeDumper" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\ExtremeDumper"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\ExtremeDumper.lnk" -ItemType SymbolicLink -Target "C:\DFIR\ExtremeDumper\ExtremeDumper.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

