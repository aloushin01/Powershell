function New-TestData {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$rootpath = "$(Split-Path $PSCommandPath)\TestFiles",

        [Parameter()]
        [int]$amount = 10
    )

    # Add rootpath folder if it does not already exist
    New-Item -Path $rootpath -ItemType "directory" -Force
    
    $lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    foreach ($i in 1..$amount) {
        $filename = "$(New-Guid).txt"
        $path = Join-Path -Path $rootpath -ChildPath $filename
        $dateString = (Get-Date).AddDays($(Get-Random -Minimum -730 -Maximum 730)).ToString("yyyy-MM-dd")
        $insertText = $lorem.Insert($(Get-Random -Minimum 0 -Maximum 453),"$dateString")

        New-Item -ItemType File -Path $path -Value $insertText | Out-Null
    }
}

New-TestData
