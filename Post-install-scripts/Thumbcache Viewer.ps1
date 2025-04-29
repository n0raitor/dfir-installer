# PowerShell PostProcess script for Thumbcache Viewer of Category C:\DFIR\_Tools\Artifact Tools

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "C:\DFIR\_Tools\Artifact Tools")) {
    New-Item -Path "C:\DFIR\_Tools\Artifact Tools" -ItemType Directory
}

$sourceLnk = "C:\Users\NormanSchmidt\AppData\Local\Microsoft\WinGet\Links\Thumbcache Viewer.lnk"
$destinationLnk = "C:\DFIR\_Tools\Artifact Tools\Thumbcache Viewer.lnk"

if (Test-Path -Path "C:\Users\NormanSchmidt\AppData\Local\Microsoft\WinGet\Links") {
    if (Test-Path -Path $sourceLnk) {
        # Copy the .lnk file if it exists
        Copy-Item -Path $sourceLnk -Destination $destinationLnk -Force
    } else {
        Write-Host "Shortcut not found: $sourceLnk"
    }
} else {
    Write-Host "WinGet packages path does not exist."
}

# Create symlink
#New-Item -Path "C:\DFIR\_Tools\Artifact Tools\Thumbcache Viewer.lnk" -ItemType SymbolicLink -Target "C:\DFIR\Thumbcache Viewer\Thumbcache Viewer.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\Artifact Tools"

