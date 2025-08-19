# PowerShell PostProcess script for PyCharmCommunityEdition of Category C:\DFIR\_Tools\Dev

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Dev")) {
    New-Item -Path "C:\DFIR\_Tools\Dev" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\PyCharmCommunityEdition") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Dev\PyCharmCommunityEdition" -ItemType SymbolicLink -Target "C:\DFIR\PyCharmCommunityEdition" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\PyCharmCommunityEdition"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Dev\PyCharmCommunityEdition" -ItemType SymbolicLink -Target "C:\DFIR\PyCharmCommunityEdition\PyCharmCommunityEdition.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Dev"

