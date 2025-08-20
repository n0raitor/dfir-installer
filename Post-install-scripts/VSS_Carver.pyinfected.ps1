# PowerShell PostProcess script for VSS_Carver.pyinfected of Category C:\DFIR\_Tools\Carving

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Carving")) {
    New-Item -Path "C:\DFIR\_Tools\Carving" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\VSS_Carver.pyinfected") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Carving\VSS_Carver.pyinfected" -ItemType SymbolicLink -Target "C:\DFIR\VSS_Carver.pyinfected" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\VSS_Carver.pyinfected"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Carving\VSS_Carver.pyinfected" -ItemType SymbolicLink -Target "C:\DFIR\VSS_Carver.pyinfected\VSS_Carver.pyinfected.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Carving"

