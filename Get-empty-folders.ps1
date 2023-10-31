$logfile = "C:\log\proc_$env:computername-emptyfolderclear.log"
function WriteLog
{
Param ([string]$LogString)
$stamp = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
$LogMessage = "$stamp $LogString"
Add-Content $logfile -Value $LogMessage
}

#Params
$Path = ""

#Find All Empty folders and write them to log file
Get-ChildItem -Path $Path -Directory -Recurse | ForEach-Object {
    if (!(Get-ChildItem -Path $_.FullName)) {
    Writelog $_.FullName
    }
}