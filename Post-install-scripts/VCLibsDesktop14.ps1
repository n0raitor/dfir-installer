# PowerShell PostProcess script for VCLibsDesktop14 of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VCLibsDesktop14") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\VCLibsDesktop14" -ItemType SymbolicLink -Target "C:\DFIR\VCLibsDesktop14" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VCLibsDesktop14"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\VCLibsDesktop14" -ItemType SymbolicLink -Target "C:\DFIR\VCLibsDesktop14\VCLibsDesktop14.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

