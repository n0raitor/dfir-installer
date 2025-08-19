# PowerShell PostProcess script for HashSuite of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\HashSuite") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\HashSuite" -ItemType SymbolicLink -Target "C:\DFIR\HashSuite" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\HashSuite"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\HashSuite" -ItemType SymbolicLink -Target "C:\DFIR\HashSuite\HashSuite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

