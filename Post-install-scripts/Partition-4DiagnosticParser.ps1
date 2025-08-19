# PowerShell PostProcess script for Partition-4DiagnosticParser of Category C:\DFIR\_Tools\Event Log Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Event Log Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Partition-4DiagnosticParser") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Event Log Tools\Partition-4DiagnosticParser" -ItemType SymbolicLink -Target "C:\DFIR\Partition-4DiagnosticParser" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Partition-4DiagnosticParser"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Event Log Tools\Partition-4DiagnosticParser" -ItemType SymbolicLink -Target "C:\DFIR\Partition-4DiagnosticParser\Partition-4DiagnosticParser.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Event Log Tools"

