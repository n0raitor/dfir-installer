# PowerShell PostProcess script for vb_decompiler_lite of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\vb_decompiler_lite") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\SRE\vb_decompiler_lite" -ItemType SymbolicLink -Target "C:\DFIR\vb_decompiler_lite" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\vb_decompiler_lite"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\vb_decompiler_lite" -ItemType SymbolicLink -Target "C:\DFIR\vb_decompiler_lite\vb_decompiler_lite.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

