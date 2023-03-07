Add-Type -AssemblyName System.Drawing

# Define the source and destination paths
$sourcePath = "$env:LocalAppData\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
$tempPath = "$env:USERPROFILE\OneDrive\Pictures\temp"
$destinationPath = "$env:USERPROFILE\Desktop2\Saved Pictures"

# Create the destination folders if they don't exist
if (-not (Test-Path $tempPath)) {
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

# Step 1: Copy files over 1000KB from sourcePath folder to temp folder
$minSize = 1000KB
Get-ChildItem -Path $sourcePath -File | Where-Object { $_.Length -gt $minSize } | Copy-Item -Destination $tempPath

# Step 2: Convert all files in temp folder to JPEG
Get-ChildItem -Path $tempPath -File | ForEach-Object {
    $extension = $_.Extension
    if ($extension -ne ".jpg") {
        $newName = $_.Name + ".jpg"
        $newPath = Join-Path -Path $_.DirectoryName -ChildPath $newName
        if ($newPath.Length -gt 260) {
            Set-Content -Path $newName -Value (Get-Content $_.FullName) -Force
            Remove-Item -Path $_.FullName -Force
        }
        else {
            Rename-Item -Path $_.FullName -NewName $newName
        }
    }
}

# Step 3: Move all 1920x1080 files from temp to destinationPath
$width = 1920
$height = 1080

Get-ChildItem -Path $tempPath -Filter *.jpg -File | Where-Object {
    $bitmap = New-Object System.Drawing.Bitmap($_.FullName)
    $result = ($bitmap.Width -eq $width) -and ($bitmap.Height -eq $height)
    $bitmap.Dispose()
    $result
} | ForEach-Object {
    $destinationFile = Join-Path -Path $destinationPath -ChildPath $_.Name
    Move-Item -Path $_.FullName -Destination $destinationFile -Force
}

Remove-Item -Path $tempPath -Recurse -Force

