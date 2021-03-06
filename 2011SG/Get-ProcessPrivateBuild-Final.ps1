$Application = Read-Host "Enter Process Name" ## Prompt user for process name
$Servers = Get-Content servers.txt ## Define a list of servers -- one per line in servers.txt
    foreach ($server in $servers) { ## for each server listed in servers.txt
        $isPrivateBuild=get-process $Application -ComputerName $server |  ## get process specified by user on each server
            Select-object -ExpandProperty modules | ## Expand Modules property on the previously selected process
                Where-Object {$_.ModuleName -match "$Application"} | ## Only get the process defined by the specified process from the user
                    Select-Object -ExpandProperty FileVersionInfo | ## Expand protery FileVersionInfo
                        Select-Object -ExpandProperty IsPrivateBuild ## Get IsPrivateBuild -- Determine if it is True/False
                        }
                        
           Write-Host "$Application, $Server, $isPrivateBuild"             ## Display Process Name, Server Name, True/False IsPrivateBuild