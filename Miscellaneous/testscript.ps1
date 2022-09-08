function test-function($x) {
    if ($x -eq 1) {
        Write-Host "One"
    } elseif ($x -eq 2) {
        Write-Host "Two"
    } elseif ($x -eq 3) {
        Write-Host "Three"
    } else {
        Write-Host "I don't know"
    }
}

$x = 2
test-function $x