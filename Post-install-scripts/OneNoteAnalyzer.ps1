# PowerShell PostProcess script for OneNoteAnalyzer of Category C:\DFIR\_Tools\Malware Analysis

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Malware Analysis")) {
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\OneNoteAnalyzer") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Malware Analysis\OneNoteAnalyzer" -ItemType SymbolicLink -Target "C:\DFIR\OneNoteAnalyzer" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\OneNoteAnalyzer"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Malware Analysis\OneNoteAnalyzer" -ItemType SymbolicLink -Target "C:\DFIR\OneNoteAnalyzer\OneNoteAnalyzer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Malware Analysis"

