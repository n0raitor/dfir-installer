# PowerShell PostProcess script for NirSoft IPNetInfo of Category C:\DFIR\_Tools\DEP

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\DEP")) {
    New-Item -Path "C:\DFIR\_Tools\DEP" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\NirSoft IPNetInfo") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\DEP\NirSoft IPNetInfo" -ItemType SymbolicLink -Target "C:\DFIR\NirSoft IPNetInfo" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\NirSoft IPNetInfo"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\DEP\NirSoft IPNetInfo" -ItemType SymbolicLink -Target "C:\DFIR\NirSoft IPNetInfo\NirSoft IPNetInfo.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\DEP"

