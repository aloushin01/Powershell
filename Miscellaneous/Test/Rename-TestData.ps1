function Rename-TestData {
    $rootpath = "$(Split-Path $PSCommandPath)\TestFiles"

    # Add rootpath folder if it does not already exist
    New-Item -Path $rootpath -ItemType "directory" -Force

    foreach ($file in (Get-ChildItem -Path $rootpath)) {
        $text = Get-Content -Raw -Path $file
        $pattern = [regex]::new("([0-9]{4}-[0-9]{2}-[0-9]{2})")
        $date = $pattern.Match($text).Groups[1]
        $newname = $file.Name -replace "^","$($date)_"

        Rename-Item -Path $file -NewName $newname | Out-Null
    }
}

Rename-TestData