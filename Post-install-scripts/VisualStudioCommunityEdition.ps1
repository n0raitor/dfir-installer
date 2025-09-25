# PowerShell PostProcess script for VisualStudioCommunityEdition of Category C:\DFIR\_Tools\Editors

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Editors")) {
    New-Item -Path "C:\DFIR\_Tools\Editors" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VisualStudioCommunityEdition") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Editors\VisualStudioCommunityEdition" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudioCommunityEdition" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VisualStudioCommunityEdition"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Editors\VisualStudioCommunityEdition.exe" -ItemType SymbolicLink -Target "C:\DFIR\VisualStudioCommunityEdition\VisualStudioCommunityEdition.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Editors"

