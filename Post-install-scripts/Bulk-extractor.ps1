# PowerShell PostProcess script for Bulk-extractor of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Bulk-extractor") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Bulk-extractor.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Bulk-extractor" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Bulk-extractor"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Bulk-extractor.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Bulk-extractor\Bulk-extractor.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

