# PowerShell PostProcess script for NirSoft WhoisThisDomain of Category C:\DFIR\_Tools\DEP

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\DEP")) {
    New-Item -Path "C:\DFIR\_Tools\DEP" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\NirSoft WhoisThisDomain") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\DEP\NirSoft WhoisThisDomain" -ItemType SymbolicLink -Target "C:\DFIR\NirSoft WhoisThisDomain" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\NirSoft WhoisThisDomain"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\DEP\NirSoft WhoisThisDomain" -ItemType SymbolicLink -Target "C:\DFIR\NirSoft WhoisThisDomain\NirSoft WhoisThisDomain.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\DEP"

