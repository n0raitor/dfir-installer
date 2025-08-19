# PowerShell PostProcess script for Git of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Git") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\Git" -ItemType SymbolicLink -Target "C:\DFIR\Git" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Git"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\Git" -ItemType SymbolicLink -Target "C:\DFIR\Git\Git.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

