# PowerShell PostProcess script for kapexplaso-pp of Category C:\DFIR\_Tools\Custom

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Custom")) {
    New-Item -Path "C:\DFIR\_Tools\Custom" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kapexplaso-pp") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Custom\kapexplaso-pp" -ItemType SymbolicLink -Target "C:\DFIR\kapexplaso-pp" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kapexplaso-pp"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Custom\kapexplaso-pp" -ItemType SymbolicLink -Target "C:\DFIR\kapexplaso-pp\kapexplaso-pp.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Custom"

