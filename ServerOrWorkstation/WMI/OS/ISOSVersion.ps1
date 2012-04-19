$OSVersion = Get-OSVersion -ComputerName esbforecast | Select-Object -ExpandProperty OSName

if ($OSVersion -like "*R2*") {Write-Host "Yep, it's $OSVersion"}
Else {Write-Host "Nope it's $OSVersion"}