# Find and Replace text
# Instructions:
# 1. Add this file to the folder where you want to run it
# 3. Make changes to the "Edit Here" section below
# 2. Right click the file and select "Run with PowerShell"
# **Note** It is always a good idea to backup files before running this script.

# Edit Here
# **Note** Searches are not case sensitive
$searchText = "change this text"
$replaceText = "This text was changed"
$fileTypes = ""
# ^^ Leave $fileTypes above empty if you want to search all, otherwise specify file types
#    ex. Search specific file types: $fileTypes = "*.html", "*.js", "*.docx", "*.css"
#    ex. Search all file types: $fileTypes = ""

# Navigate to current location
$scriptPath = $PSScriptRoot
Set-Location -Path $scriptPath

if ($fileTypes -and $fileTypes.Length -gt 0) {
    Get-ChildItem -Recurse -Include $fileTypes | ForEach-Object {
        $content = Get-Content $_.FullName
        $modifiedContent = $content -replace $searchText, $replaceText
        $modifiedContent | Set-Content $_.FullName
    }
}
else {
    Get-ChildItem -Recurse -Exclude "*.ps1" | ForEach-Object {
        $content = Get-Content $_.FullName
        $modifiedContent = $content -replace $searchText, $replaceText
        $modifiedContent | Set-Content $_.FullName
    }
}

