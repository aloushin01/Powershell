Set-StrictMode -Version Latest
function FizzBuzzOuter {
   param (
      [Parameter(Mandatory=$true)]   
      [Int[]] $NumArray,

      [Parameter(Mandatory=$true)]
      [hashtable[]] $ValArray
   )

   $SortedArray = $ValArray | Sort-Object -Property Divisor -Descending

   foreach ($i in $NumArray) {
      FizzBuzzInner -Num $i -ValArray $SortedArray
   }
}

function FizzBuzzInner {
   param (
      [Parameter(Mandatory=$true)]   
      [Int] $Num,

      [Parameter(Mandatory=$true)]
      [hashtable[]] $ValArray
   )

   foreach ($x in $ValArray) {
      if (($Num % $x.Divisor) -eq 0) {
         Return $x.Text
      }
   }
   Return $i
}

$ValArray = @(
   @{
      Divisor = 5;
      Text = "Fizz"
   },@{
      Divisor = 3;
      Text = "Buzz"
   },@{
      Divisor = 15;
      Text = "FizzBuzz"
   }
)

FizzBuzzOuter -NumArray (1..100) -ValArray $ValArray

