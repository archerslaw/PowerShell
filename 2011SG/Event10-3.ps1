$Average = (@(1..5 | %{ Measure-Command {Start-Sleep 5}} | Select-Object -ExpandProperty TotalMilliseconds ) | Measure-Object -average).Average

Write-Host "Average time of 5 runs of 5 seconds is $Average milliseconds"