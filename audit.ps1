Import-Module ActiveDirectory

Function audit-adcomputers ($domain, $days)
{
<#

.SYNOPSIS

Searches Active Directory for computers that have not contacted AD for a specified ammount of time



.DESCRIPTION

This function is used to help you discover computers that have not been in use for some time, and will allow you to manage your AD better.


.PARAMETER Domain

Specify your domain here


.PARAMETER Days

Used to set the time span from last known login to current date


.EXAMPLE

audit-adcomputers -domain test.net -days 90



.NOTES

Will require access to Active directory and rights to read and access records within it.

#>
$time = (Get-Date).AddDays(-($days))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -Properties LastLogonTimeStamp | 
select-object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}} 
} 

Function audit-adusers 
{
<#

.SYNOPSIS
Used to find old and unused user accounts.


.DESCRIPTION

This Audit-aduser cmd-let will allow you to find and list user accounts that have been in disuse.



.NOTES

Will require access to Active directory and rights to read and access records within it.

#>

Get-ADUser -Filter * -Properties "LastLogonDate"| Sort-Object -Property lastlogondate -Descending |Format-Table -Property name, lastlogondate -AutoSize

}

