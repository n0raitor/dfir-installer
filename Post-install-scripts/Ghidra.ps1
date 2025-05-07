# PowerShell PostProcess script for Ghidra of Category C:\DFIR\_Tools\SRE

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\SRE")) {
    New-Item -Path "C:\DFIR\_Tools\SRE" -ItemType Directory
}

# Check if the tool directory exists
$sourceLnk = "C:\ProgramData\chocolatey\lib\ghidra\tools\ghidra_11.3.2_PUBLIC\ghidraRun.bat"
$destinationLnk = "C:\DFIR\_Tools\SRE\Ghidra.lnk"

if (Test-Path -Path $sourceLnk) {
    # Copy the .lnk file if it exists
    Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
} else {
    Write-Host "EXE not found: $sourceLnk"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\SRE\Ghidra.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Ghidra\Ghidra.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\SRE"

