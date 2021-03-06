# function Get-BasicInfo {
param(
[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()]
$args
)

$Date = Get-Date -format d

$WMIQuery = @{
            'class'='Win32_OperatingSystem';
            'ErrorAction'='SilentlyContinue';
             }



$OSName = Get-WmiObject @WMIQuery -ComputerName $args | Select-Object -ExpandProperty Caption


@"
USER:     ${env:UserName}
COMPUTER: ${env:ComputerName}
DOMAIN:   ${env:DomainName}
OS:       $OSName
User information collected on: $Date
"@ | 
Format-List | Out-File -FilePath info.txt -Encoding ASCII

# }