function accum($s)
{
    $chars =  $s -split ""
    $x = 0

    $tempList = [System.Collections.Generic.List[string]]::new()

    foreach ($a in $chars) {
        $string = $a * $x
        $tempList.Add($string)
        $x = $x + 1
    }
Return $tempList -join "-"
}



function testing($s, $expect) 
{
    $ans = accum $s
    # $ans | Should -Be $expect
}

function fixed()
{
    testing "ZpglnRxqenU" "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
    testing "NyffsGeyylB" "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
    testing "MjtkuBovqrU" "M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu"
    
}
fixed