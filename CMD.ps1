param([string]$logFileName)

$file_logfile = "c:/Logs/" + $env:logFileName

if(!(test-path $file_logfile)) {
    New-Item -Path $file_logfile -ItemType File | out-null
}

get-item -Path $file_logfile

@(1..6000) | foreach-object {
    speedtest-cli --json | tee-object -variable data
    $data | Out-File -FilePath $file_logfile -Encoding utf8 -Append
    $data | convertfrom-json
} | format-table