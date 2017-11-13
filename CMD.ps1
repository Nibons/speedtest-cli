param([string]$logFileName = 'speedtest.csv')

$file_logfile = "c:/Logs/$logFileName"

if(!(test-path $file_logfile)) {
    New-Item -Path $file_logfile -ItemType File
}

do{
    speedtest-cli --json | tee-object -FilePath $file_logfile -Append  | ConvertFrom-Json | format-table
}while($true)