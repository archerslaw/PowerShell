$AllDisabled = (Get-QADUser -SearchRoot 'OU=DISABLED,DC=sub,DC=tld,DC=EDU').Count #Counts All Disabled Users in the Disable OU
$90OrOlder = (Get-QADUser -SearchRoot 'OU=DISABLED,DC=sub,DC=tld,DC=EDU' -NotLoggedOnFor 90).Count #Displays all Users who haven't logged in in 90 Days or More
$tldID = (Get-QADUser -SearchRoot 'OU=DISABLED,DC=sub,DC=tld,DC=EDU' -IncludeAllProperties) | Select-Object -ExpandProperty tldID #Gets 988 Number of users




Write-Host "There are $AllDisabled Users in the Disabled OU" #Displays Message of how many users are in the Disabled OU
Write-Host "There are $90OrOlder Users in the Disabled OU 90 Days or Older" #Displays a Message of how many users are 90 Days or older


##ADAM###

Connect-QADService -service 'adam1.sub.tld.edu:50004' #Connect to ADAM
$tldID | Foreach {Get-QADObject -LdapFilter "(tldID=$($_))"} | Foreach {Remove-QADObject $_.DN -whatif}
Disconnect-QADservice



##Active Directory

Get-QADUser -SearchRoot 'OU=DISABLED,DC=sub,DC=tld,DC=EDU' | Foreach {Remove-QADObject $_.DN -whatif}  #Gets Users, then Deletes users from Active Directory.  Remove -whatif to actually delete user(s).