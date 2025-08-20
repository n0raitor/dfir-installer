# PowerShell PostProcess script for Regcool of Category C:\DFIR\_Tools\Registry Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Registry Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Registry Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Regcool") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Registry Tools\Regcool" -ItemType SymbolicLink -Target "C:\DFIR\Regcool" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Regcool"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Registry Tools\Regcool" -ItemType SymbolicLink -Target "C:\DFIR\Regcool\Regcool.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Registry Tools"

