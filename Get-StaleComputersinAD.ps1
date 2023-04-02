 
#This script will get stale computer objects that are more than 90 days

Import-Module ActiveDirectory -Verbose

$DaysInactive = 90

$InactiveDate = (Get-Date).Adddays(-($DaysInactive))

$Computers = Get-ADComputer -Filter { LastLogonDate -lt $InactiveDate -and Enabled -eq $true } -Properties LastLogonDate | Select-Object Name, LastLogonDate, DistinguishedName

$Computers | Export-Csv C:\Temp\InactiveComputers.csv -NoTypeInformation
