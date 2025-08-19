# PowerShell PostProcess script for Metasploit Framework of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\Metasploit Framework") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\Metasploit Framework" -ItemType SymbolicLink -Target "C:\DFIR\Metasploit Framework" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\Metasploit Framework"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\Metasploit Framework" -ItemType SymbolicLink -Target "C:\DFIR\Metasploit Framework\Metasploit Framework.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

