$EmailFrom = "blah@blah.com"
$EmailTo = "blah@blah.com"
$Subject = " storage report"
$servers = @("SERVERNAME","SERVERNAME")
$body = foreach ($s in $servers) {Get-WmiObject win32_logicaldisk -computername $s | ft -auto SystemName, DeviceID, @{ Label = "Size(GB)" ; Expression = { "{0:N2}" -f ($_.Size/1024/1024/1024) } },@{ Label ="FreeSpace(GB)" ; Expression = { "{0:N2}" -f ($_.FreeSpace/1024/1024/1024) } } |ft |Out-String}
$SMTPServer = "mail.netregistry.net"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
