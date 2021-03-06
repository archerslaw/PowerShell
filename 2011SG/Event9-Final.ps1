## Creates 20110417.log file
$fileName = "{0:yyyyMMdd}.log" -f(Get-Date)

## Tests to see if File exists
$FileExists = Test-Path $Filename

    ## If file exists
    If ($FileExists -eq "True"){
    
        ## Append a HourMinuteSecond to filename, creating a unique name for the log file
        $NewFilename = "{0:yyyyMMdd}-{0:hhmmss}.log" -f(Get-Date)
        ## Creates New File
        New-Item $NewFilename -type file
        }
    ## If file doesn't exists
    Else {
        ## Creates File
        New-Item $Filename -type file
        }
        
        