$OSVersion = Get-OSVersion | Select-Object -ExpandProperty OSName

if ($OSVersion -eq "Microsoft Windows 7 Ultimate") {Write-Host "Yep, it's $OSVersion"}
Else {Write-Host "Nope it's $OSVersion"}