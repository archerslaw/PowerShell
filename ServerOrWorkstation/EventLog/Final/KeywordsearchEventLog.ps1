#variable for Log to Parse (System, Application, Security)
$log = Read-Host "Enter Windows Log to Parse"

#Enter Event ID to search for in previously specificed Windows Event Logs
$evtID = Read-Host "Enter Event ID"

#Enter a Keyword to search for in Event Logs
$keyword = Read-Host "Enter Keyword you want to search"

#Get the number of Event ID's found based on Event ID
$evtIDcount = (Get-EventLog -LogName $log | where {$_.EventID -eq $evtID}).count

#Get the number of Event ID's based on Keyword specified
$keywordCount = (Get-EventLog -LogName $log | where {$_.EventID -eq $evtId -and $_.message -match $keyword }).count

#Write's number of Event ID's found in the specified Windows Event Logs
Write-Host "$evtIDcount" - "$evtID" Event Ids Exists in the Windows "$log" Event Log

#Write's the number of Event ID's based on keyword searched for.
Write-Host  The keyword "$keyword" appears in "$keywordCount" of those events listed below.

#Display's Event Logs searched for
Get-EventLog -LogName $log | where {$_.EventID -eq $evtId -and $_.message -match $keyword }


