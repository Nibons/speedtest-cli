param([string]$logFileName)

$file_logfile = "c:/Logs/$logFileName"

do{
    speedtest-cli --json  | ConvertFrom-Json | tee-object -FilePath $file_logfile -Append | format-table
}while($true)