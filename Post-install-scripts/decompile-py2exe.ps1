# PowerShell PostProcess script for decompile-py2exe of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\decompile-py2exe") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\decompile-py2exe" -ItemType SymbolicLink -Target "C:\DFIR\decompile-py2exe" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\decompile-py2exe"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\decompile-py2exe" -ItemType SymbolicLink -Target "C:\DFIR\decompile-py2exe\decompile-py2exe.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

