# Big O = 2**n
function Get-FibonacciR($int) {
    if ($int -eq 1) {
        return 0
    } elseif ($int -eq 2) {
        return 1
    } else {
        return (Get-Fibonacci -int ($int - 1)) + (Get-Fibonacci -int ($int - 2))
    }
}

# Big O = O(n)
function Get-FibonacciL($int) {
    $small = 0 
    $big = 1

    for ($i = 2; $i -le $int; $i += 1) {
        $small, $big = $big, ($small + $big)
    } 

    if ($int -eq 1) {
        return $small
    } else {
        return $big
    }
}

$int = 30

Write-Host "Loop: $((Measure-Command {Get-FibonacciL -int $int}).TotalSeconds)"
Write-Host "Recu: $((Measure-Command {Get-FibonacciR -int $int}).TotalSeconds)"