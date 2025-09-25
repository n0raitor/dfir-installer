# PowerShell PostProcess script for SecureRM of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\SecureRM") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\SecureRM" -ItemType SymbolicLink -Target "C:\DFIR\SecureRM" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\SecureRM"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\SecureRM.exe" -ItemType SymbolicLink -Target "C:\DFIR\SecureRM\SecureRM.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

