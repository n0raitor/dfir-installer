# PowerShell PostProcess script for Cmder of Category C:\DFIR\_Tools\Terminal

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Terminal")) {
    New-Item -Path "C:\DFIR\_Tools\Terminal" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Cmder") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Terminal\Cmder.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Cmder" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Cmder"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Terminal\Cmder.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Cmder\Cmder.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Terminal"

