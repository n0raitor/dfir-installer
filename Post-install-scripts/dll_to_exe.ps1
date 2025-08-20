# PowerShell PostProcess script for dll_to_exe of Category C:\DFIR\_Tools\Other

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Other")) {
    New-Item -Path "C:\DFIR\_Tools\Other" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\dll_to_exe") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Other\dll_to_exe" -ItemType SymbolicLink -Target "C:\DFIR\dll_to_exe" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\dll_to_exe"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Other\dll_to_exe" -ItemType SymbolicLink -Target "C:\DFIR\dll_to_exe\dll_to_exe.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Other"

