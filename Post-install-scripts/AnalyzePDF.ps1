# PowerShell PostProcess script for AnalyzePDF of Category C:\DFIR\_Tools\Malware Analysis

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Malware Analysis")) {
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\AnalyzePDF") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis\AnalyzePDF" -ItemType SymbolicLink -Target "C:\DFIR\AnalyzePDF" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\AnalyzePDF"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Malware Analysis\AnalyzePDF" -ItemType SymbolicLink -Target "C:\DFIR\AnalyzePDF\AnalyzePDF.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Malware Analysis"

