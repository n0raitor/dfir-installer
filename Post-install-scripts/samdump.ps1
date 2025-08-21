# PowerShell PostProcess script for samdump of Category C:\DFIR\_Tools\Offensive

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Offensive")) {
    New-Item -Path "C:\DFIR\_Tools\Offensive" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "C:\DFIR\samdump") {
    # Create symlink if tool directory exists
    New-Item -Path "C:\DFIR\_Tools\Offensive\samdump" -ItemType SymbolicLink -Target "C:\DFIR\samdump" -Force
} else {
    Write-Host "Tool directory does not exist: C:\DFIR\samdump"
}

Write-Host "Please Compile samdump using Developer Command Prompt for VS 20XX by cd to the samdump directory and run the following command: msbuild samdump.sln /p:Configuration=Release"
# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Offensive\samdump" -ItemType SymbolicLink -Target "C:\DFIR\samdump\samdump.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Offensive"

