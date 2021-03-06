param(
    [string]$Count = 5,
    $Script = {Start-Sleep 5}
    )

$Average = (@(1..$Count | %{ Measure-Command $Script} | Select-Object -ExpandProperty TotalMilliseconds ) | Measure-Object -average).Average

Write-Host "Average time of $Count runs of $Script is $Average milliseconds"