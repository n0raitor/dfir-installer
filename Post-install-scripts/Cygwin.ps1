# PowerShell PostProcess script for Cygwin of Category C:\DFIR\_Tools\Terminal

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Terminal")) {
    New-Item -Path "C:\DFIR\_Tools\Terminal" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\cygwin64\bin\"
$destinationLnk = "C:\DFIR\_Tools\Terminal\Cygwin64"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    New-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Terminal\Cygwin" -ItemType SymbolicLink -Target "C:\DFIR\Cygwin\Cygwin.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Terminal"

