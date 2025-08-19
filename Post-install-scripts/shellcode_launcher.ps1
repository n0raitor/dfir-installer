# PowerShell PostProcess script for shellcode_launcher of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\shellcode_launcher") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\SRE\shellcode_launcher" -ItemType SymbolicLink -Target "C:\DFIR\shellcode_launcher" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\shellcode_launcher"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\shellcode_launcher" -ItemType SymbolicLink -Target "C:\DFIR\shellcode_launcher\shellcode_launcher.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

