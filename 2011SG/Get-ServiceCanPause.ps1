$Servers = Get-content servers.txt ## Define a list of servers
foreach ($server in $Servers) { ## Foreach server in servers.txt
     Get-Service -ComputerName $server | ## Get Service on each server
        Select-Object -Property * | ## Select all services of each service
            Where-Object {$_.CanPauseAndContinue -eq "True"} | ## Select Services that only accept a Pause command
                Where-Object {$_.Status -eq "Running"}  | ## Select Services that are only in a "running" status
                    Format-Table -auto Status, Name, DisplayName ## Output display
     }