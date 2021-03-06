$Date = Get-Date -format d
$OSName = Get-WmiObject Win32_OperatingSystem | Select-Object -ExpandProperty Caption
    
    

$Information = @"
$env:UserName
$env:ComputerName
$env:DomainName
$OSName

"User information collected on: $Date"
"@

$Information | Format-List | Out-File -FilePath info.txt -Encoding ASCII 