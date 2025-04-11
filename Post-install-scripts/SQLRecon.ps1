# PowerShell PostProcess script for SQLRecon of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\SQLRecon") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\SQLRecon.lnk" -ItemType SymbolicLink -Target "C:\DFIR\SQLRecon" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\SQLRecon"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\SQLRecon.lnk" -ItemType SymbolicLink -Target "C:\DFIR\SQLRecon\SQLRecon.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

