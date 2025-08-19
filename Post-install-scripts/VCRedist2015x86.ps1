# PowerShell PostProcess script for VCRedist2015x86 of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VCRedist2015x86") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\VCRedist2015x86" -ItemType SymbolicLink -Target "C:\DFIR\VCRedist2015x86" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VCRedist2015x86"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\VCRedist2015x86" -ItemType SymbolicLink -Target "C:\DFIR\VCRedist2015x86\VCRedist2015x86.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

