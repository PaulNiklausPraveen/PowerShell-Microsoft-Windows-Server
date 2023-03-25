

![image](https://user-images.githubusercontent.com/62203157/227738924-4b402b68-f587-4740-a8e9-4cd25120187b.png)



This Document Contains Powershell Cmdlets related to Active Directory







>Get-Command -Module ActiveDirectory  

Display Basic Domain Information

>Get-ADDomain

Get all Domain Controllers by Hostname and Operating

>Get-ADDomainController -Filter * | format-Table hostname, operatingsystem

#Get all Fine Grained Password Policies

>Get-ADFineGrainedPasswordPolicy -Filter *

#Get Domain Default Password Policy

>Get-ADDefaultDomainPasswordPolicy

Get User and List All Properties (attributes)

>Get-ADUser username -Properties *

Get User and List Specific Properties

>Get-ADUser Username -Properties * | Select-Object Name, Department, Title

Get All Active Directory Users in Domain

>Get-ADUser -Filter *

Get All Users From a Specific  OU

>Get-ADUser -SearchBase “OU=Berlin Users,DC=AD,dc=Germany.com” -Filter * | Select-Object Name,SamAccountName,Enabled,LastLoginTimeStamp

Get AD Users by Name

>get-Aduser -Filter {name -like "*Berlin*"} | Select-Object Name,SamAccountName,Enabled,LastLoginTimeStamp

Get All Disable User Accounts

>Search-ADAccount -AccountDisabled | select-Object name,SamAccountName

Disable User Account

Disable-ADAccount -Identity Berlin

Get All Accounts with Password Set to Never Expire

>Get-ADuser -Filter * -Properties Name, PasswordNeverExpires | where {$_.PasswordNeverExpires -EQ "True" } | Select-Object Name,Enabled,DistinguishedName



Active Directory Group CmdLets :


Get All members Of A Security Group

>Get-ADGroupMember -identity “Berlin Users”

Add User to Group

>Add-ADGroupMember -Identity group-name -Members BerlinUser1, BerlinUser2

Export Users From a Group

Get-ADGroupMember -identity “MunichGroup” | Select-Object Name | Export-csv -path C:\Temp\MunichGroupMembers.csv -NoTypeInformation


















