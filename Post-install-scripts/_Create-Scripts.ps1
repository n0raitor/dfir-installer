# Import the Excel module
Import-Module ImportExcel

# Define the path to the Excel file
$excelPath = "..\..\dfir-installer-selector\dfir-installer-selector.xlsx"

# Read the Excel file into a variable
$excelData = Import-Excel -Path $excelPath

# Ensure the Scripts folder exists
$scriptDir = ".\Scripts"
if (!(Test-Path -Path $scriptDir)) {
    New-Item -Path $scriptDir -ItemType Directory
}

# Loop through each row in the Excel file
foreach ($row in $excelData) {
    $toolName = $row.Tool
    $categoryName = $row.Kategorie
    
    $categoryPath = "C:\DFIR\_Tools\$categoryName"
    $toolDir = "C:\DFIR\$toolName"
    $scriptContent = @"
# PowerShell PostProcess script for $toolName of Category $categoryPath

# Check if the category path exists, if not, create it
if (!(Test-Path -Path "$CategoryPath")) {
    New-Item -Path "$CategoryPath" -ItemType Directory
}

# Check if the tool directory exists
if (Test-Path -Path "$toolDir") {
    # Create symlink if tool directory exists
    New-Item -Path "$categoryPath\$toolName" -ItemType SymbolicLink -Target "$toolDir" -Force
} else {
    Write-Host "Tool directory does not exist: $toolDir"
}

# Create symlink
#New-Item -Path "$categoryPath\$toolName.exe" -ItemType SymbolicLink -Target "C:\DFIR\$toolName\$toolName.exe" -Force

# File moving command will be inserted here
# Move-Item -Path C:\DFIR\ -Destination "C:\DFIR\Tools\$categoryName"

"@

    # Define the path for the new PowerShell script
    $scriptPath = ".\$toolName.ps1"

    # Check if the file already exists
    if (!(Test-Path -Path $scriptPath)) {
        # Create the PowerShell script file and insert the content
        Set-Content -Path $scriptPath -Value $scriptContent
        Write-Host "File created: $scriptPath"
    } else {
        Write-Host "File already exists: $scriptPath"
    }

}

Write-Host "PowerShell scripts have been created successfully."
