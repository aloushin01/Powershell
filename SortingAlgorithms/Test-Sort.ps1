function Test-Sort {
    $numList = 1..100

    $randomList = $numList | Sort-Object {Get-Random}

    $sortedList = $randomList | MySort

    if ((Compare-Object $numList $sortedList).Length -eq 0) {
        Write-Host "They match!"
    } 
    else {
        Write-Host "No match."
    }
}

function MySort {
    param (
        [Parameter(
            Mandatory=$True,
            ValueFromPipeline=$True
        )]
        [Array]$array
    )

    Return $array
}

Test-Sort