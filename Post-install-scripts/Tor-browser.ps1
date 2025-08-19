# PowerShell PostProcess script for Tor-browser of Category C:\DFIR\_Tools\Browser

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Browser")) {
    New-Item -Path "C:\DFIR\_Tools\Browser" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Tor-browser") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Browser\Tor-browser" -ItemType SymbolicLink -Target "C:\DFIR\Tor-browser" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Tor-browser"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Browser\Tor-browser" -ItemType SymbolicLink -Target "C:\DFIR\Tor-browser\Tor-browser.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Browser"

