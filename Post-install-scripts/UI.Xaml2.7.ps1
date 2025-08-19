# PowerShell PostProcess script for UI.Xaml2.7 of Category C:\DFIR\_Tools\Frameworks

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Frameworks")) {
    New-Item -Path "C:\DFIR\_Tools\Frameworks" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\UI.Xaml2.7") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Frameworks\UI.Xaml2.7" -ItemType SymbolicLink -Target "C:\DFIR\UI.Xaml2.7" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\UI.Xaml2.7"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Frameworks\UI.Xaml2.7" -ItemType SymbolicLink -Target "C:\DFIR\UI.Xaml2.7\UI.Xaml2.7.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Frameworks"

