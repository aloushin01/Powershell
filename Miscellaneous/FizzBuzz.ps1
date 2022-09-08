foreach ($i in 1..100) {
 if (($i % 15) -eq 0) {
    Write-Host "FizzBuzz"
 } elseif (($i % 5) -eq 0) {
    Write-Host "Buzz"
 } elseif (($i % 3) -eq 0) {
    Write-Host "Fizz"
 } else {
    Write-Host $i
 }
}