
#Install Windows Server Backup feature

Add-WindowsFeature Windows-Server-Backup -IncludeManagementTools

#Create backup policy:
$BackupPolicy = New-WBPolicy

#Adding the backup sources
$BackupPolicy | Add-WBBareMetalRecovery

$BackupPolicy | Add-WBSystemState

#Adding the Volume C for backup

$sourceVolume = Get-WBVolume C:

Add-WBVolume -Policy $BackupPolicy -Volume $sourceVolume

#Adding the destination to save backup files
$TargetPath = New-WBBackupTarget  -Volume (Get-WBVolume E:)

Add-WBBackupTarget -Policy $BackupPolicy -Target $TargetPath

#Set the time of the backup
Set-WBSchedule -Policy $BackupPolicy -Schedule ("06/03/2022 12:00:00 PM")

#Save the backup policy

Set-WBPolicy -Policy $BackupPolicy -Force

#Initiate the backup manually

Get-WBPolicy | Start-WBBackup 



#To review the backup details,
Get-WBSummary