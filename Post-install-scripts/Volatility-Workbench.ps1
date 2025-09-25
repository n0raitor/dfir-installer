# PowerShell PostProcess script for Volatility-Workbench of Category C:\DFIR\_Tools\Volatile

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Volatile")) {
    New-Item -Path "C:\DFIR\_Tools\Volatile" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Volatility-Workbench") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Volatile\Volatility-Workbench" -ItemType SymbolicLink -Target "C:\DFIR\Volatility-Workbench" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Volatility-Workbench"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Volatile\Volatility-Workbench.exe" -ItemType SymbolicLink -Target "C:\DFIR\Volatility-Workbench\Volatility-Workbench.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Volatile"

