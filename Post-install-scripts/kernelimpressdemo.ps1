# PowerShell PostProcess script for kernelimpressdemo of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\kernelimpressdemo") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelimpressdemo" -ItemType SymbolicLink -Target "C:\DFIR\kernelimpressdemo" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\kernelimpressdemo"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\kernelimpressdemo.exe" -ItemType SymbolicLink -Target "C:\DFIR\kernelimpressdemo\kernelimpressdemo.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

