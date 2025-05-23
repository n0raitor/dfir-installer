# PowerShell PostProcess script for Chrome of Category C:\DFIR\_Tools\Browser

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Browser")) {
    New-Item -Path "C:\DFIR\_Tools\Browser" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Chrome") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Browser\Chrome.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Chrome" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Chrome"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Browser\Chrome.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Chrome\Chrome.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Browser"

