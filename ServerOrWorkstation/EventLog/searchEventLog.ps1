#Get the Windows Event Log to search (System, Application, Security)
$log = Read-Host "Enter Windows Log to Parse"

#Get the Event ID to search for
$evtID = Read-Host "Enter Event ID"

#Count the number of Event Logs Found
$count = (Get-EventLog -LogName $log | where {$_.EventID -eq $evtID}).count

#This doesn't work --
#$index = Read-Host "Enter Index to View Event ID"

#Displays number of Event ID's found
Write-Host "$count" - "$evtID" Event Ids Exists in "$log" Log

#Displays the Event ID's
Get-EventLog -LogName $log | where {$_.EventID -eq $evtID}


