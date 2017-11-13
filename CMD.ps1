param([string]$logFileName)

$file_logfile = "c:/Logs/" + $env:logFileName

if(!(test-path $file_logfile)) {
    New-Item -Path $file_logfile -ItemType File | out-null
}

get-item -Path $file_logfile


@(1..6000) | foreach-object {
    speedtest-cli --json | tee-object -variable json
    $data = $json | convertfrom-json
    $data | export-csv -Path $file_logfile -Encoding UTF8 -Append
    $data
} | format-table