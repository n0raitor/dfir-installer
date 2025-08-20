# PowerShell PostProcess script for Innounp of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Innounp") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\Innounp" -ItemType SymbolicLink -Target "C:\DFIR\Innounp" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Innounp"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\Innounp" -ItemType SymbolicLink -Target "C:\DFIR\Innounp\Innounp.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

