# PowerShell PostProcess script for MemoryDumperx64 of Category C:\DFIR\_Tools\Volatile

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Volatile")) {
    New-Item -Path "C:\DFIR\_Tools\Volatile" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\MemoryDumperx64") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Volatile\MemoryDumperx64" -ItemType SymbolicLink -Target "C:\DFIR\MemoryDumperx64" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\MemoryDumperx64"
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Volatile\MemoryDumperx64" -ItemType SymbolicLink -Target "C:\DFIR\MemoryDumperx64\MemoryDumperx64.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Volatile"

