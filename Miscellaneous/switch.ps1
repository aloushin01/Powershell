function test-function($x) {
    switch ($x) {
        (1) { Write-Host "One-x"} 
        (2) {Write-Host "Two-x"}
        (3) {Write-Host "Three-x"} 
        Default {Write-Host "I don't know-x"}
    }
}

$x = 2
test-function $x