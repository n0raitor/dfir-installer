# PowerShell PostProcess script for ScyllaHide of Category C:\DFIR\_Tools\OSINT

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\OSINT")) {
    New-Item -Path "C:\DFIR\_Tools\OSINT" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\ScyllaHide") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\OSINT\ScyllaHide.lnk" -ItemType SymbolicLink -Target "C:\DFIR\ScyllaHide" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\ScyllaHide"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\OSINT\ScyllaHide.lnk" -ItemType SymbolicLink -Target "C:\DFIR\ScyllaHide\ScyllaHide.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\OSINT"

