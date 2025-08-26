# PowerShell PostProcess script for DBBrowserForSQLite of Category C:\DFIR\_Tools\Browser Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Browser Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Browser Tools" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\Program Files\DB Browser for SQLite\DB Browser for SQLite.exe"
$destinationLnk = "C:\DFIR\_Tools\Browser Tools\DB Browser for SQLite.exe"

if (Test-Path -Path $sourceLnk) {
    # Copy the  file if it exists
    CNew-Item -ItemType SymbolicLink -Force -Path $destinationLnk -Target $sourceLnk
} else {
    Write-Host "EXE not found: $sourceLnk" -ForegroundColor Red
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Browser Tools\DBBrowserForSQLite" -ItemType SymbolicLink -Target "C:\DFIR\DBBrowserForSQLite\DBBrowserForSQLite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Browser Tools"