<#
Sorting methods:
Selection sort - identify smallest in list and move to front. Repeat.
Bubble sort - compare first two items in list and check if they are in the correct order. If yes, move to next pair. If not, switch them then move to next pair.
Insertion sort - Go through unsorted items in order and put into their proper spot in the sorted part of the list.
Merge sort - Divide list in half. Divide each half in half. Repeat until you get down to one item in each half. Sort each pair then start merging pairs together.
Quick sort - pick an element out of the array. Divide array into two arrays - one with items that are higher and one with items that are lower. Repeat.
#>

function Test-Sort {
    $inputList = 1..100
    # $inputList = "apple", "orange", "cat", "tree", "apple"

    $randomList = $inputList | Sort-Object {Get-Random}

    $mySortedList = MySort -method "Test" -array $randomList

    $sortedList = $inputList | Sort-Object

    if ((Compare-Object $mySortedList $sortedList -SyncWindow 0).Length -eq 0) {
        Write-Host "They match!"
    } 
    else {
        Write-Host "No match."
    }
    Write-Host $mySortedList
    Write-Host $sortedList
}

function MySort {
    param (
        [Parameter(
            Mandatory=$True,
            Position=0
        )]
        [Alias("Method")]
        [ValidateSet("Selection","Insertion","Bubble","Merge","Quick")]
        $sortMethod,
    
        [Parameter(
            Mandatory=$True,
            Position=1
        )]
        $array
    )

    if ($sortMethod -eq "Selection") {
        Return My-SelectionSort $array
    }
    elseif ($sortMethod -eq "Insertion") {
        Return My-InsertionSort $array
    }
    else {
        throw "Method not implemented."
    }
}

function Swap {
    param (
        [Parameter(
            Mandatory=$True
        )]
        $array,

        [Parameter(
            Mandatory=$True
        )]
        $index1,

        [Parameter(
            Mandatory=$True
        )]
        $index2
    )
    
    $temp = $array[$index2]
    $array[$index2] = $array[$index1]
    $array[$index1] = $temp

    Return $array

}

function My-SelectionSort {
    param (
        [Parameter(
            Mandatory=$True,
            Position=0
        )]
        $array
    )

    $i = 0
    # Repeat until list is sorted
    While ($i -lt $array.Length) {
        # Identify smallest item in array
        $minItem = ($array[$i..$array.Length] | Measure-Object -Minimum).Minimum

        # Find the index of the smallest item
        $index = ($array[$i..$array.Length]).IndexOf($minItem) + $i

        # Swap min item into current index we are sorting
        if ($i -ne $index) {
            $array = Swap -array $array -index1 $i -index2 $index
        }

        $i += 1
    }

    Return $array
}

function My-InsertionSort {
    param (
        [Parameter(
            Mandatory=$True,
            Position=0
        )]
        $array
    )

    Return $array
}

Test-Sort