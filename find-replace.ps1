#This script will run whereever it is placed and will search for text in any file in any directory in the location and find/replace

# Get the directory path of the currently executing script
$scriptPath = $PSScriptRoot

# Navigate to the script directory
Set-Location -Path $scriptPath

# How To Edit
# 1. Make sure the filetypes you want to search are included
#    ex...  -Include "*.php", "*.css", "*.file-type", etc...  |
# 2. Update find/replace text
#    ex... -replace "Text to search", "Replace with this"

Get-ChildItem -Recurse -Include "*.php" | ForEach-Object {
    $content = Get-Content $_.FullName
    $modifiedContent = $content -replace "@dos.fl.gov", "@davis-is-cool"
    $modifiedContent | Set-Content $_.FullName
}


