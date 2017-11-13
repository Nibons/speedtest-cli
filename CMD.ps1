param([string]$logFileName)

$file_logfile = "c:/Logs/" + $env:logFileName

if(!(test-path $file_logfile)) {
    New-Item -Path $file_logfile -ItemType File | out-null
}

get-item -Path $file_logfile


@(1..6000) | foreach-object {
    $json = speedtest-cli --json
    $data = $json | convertfrom-json | select-object download,upload,ping,timestamp,bytes_sent,bytes_received,share
    $data | export-csv -Path $file_logfile -Encoding UTF8 -Append
    $data
} | format-table