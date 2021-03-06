<# 
   .Synopsis 
    Get's a list of Services using non-standard service accounts
      .Notes 
    NAME: Get-ServiceNonStandardServiceAccount
    AUTHOR: Barry Morrison 
    LASTEDIT: 04/09/2011 15:03:48 
    KEYWORDS: 
   .Link 
    Http://www.BarryMorrison.com
#Requires -Version 2.0 
#> 

$Servers = Get-Content Servers.txt
foreach ($server in $servers){
Get-WmiObject Win32_Service -ComputerName $server -ErrorAction SilentlyContinue | 
Where-Object { @("NT Authority\LocalService", "LocalSystem","NT Authority\NetworkService") -notcontains $_.StartName} | 
Format-Table StartName, Name, Displayname
}