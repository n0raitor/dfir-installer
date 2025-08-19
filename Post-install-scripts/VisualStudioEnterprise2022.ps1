# PowerShell PostProcess script for VisualStudioEnterprise2022 of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VisualStudioEnterprise2022") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\VisualStudioEnterprise2022" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudioEnterprise2022" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VisualStudioEnterprise2022"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\VisualStudioEnterprise2022" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudioEnterprise2022\VisualStudioEnterprise2022.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

