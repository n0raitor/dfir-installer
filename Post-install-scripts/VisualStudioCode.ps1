# PowerShell PostProcess script for VisualStudioCode of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VisualStudioCode") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\VisualStudioCode.lnk" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudioCode" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VisualStudioCode"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\VisualStudioCode.lnk" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudioCode\VisualStudioCode.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

