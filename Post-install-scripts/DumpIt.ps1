# PowerShell PostProcess script for DumpIt of Category C:\DFIR\_Tools\Volatile

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Volatile")) {
    New-Item -Path "C:\DFIR\_Tools\Volatile" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\DumpIt") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Volatile\DumpIt" -ItemType SymbolicLink -Target "C:\DFIR\DumpIt" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\DumpIt"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Volatile\DumpIt" -ItemType SymbolicLink -Target "C:\DFIR\DumpIt\DumpIt.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Volatile"

