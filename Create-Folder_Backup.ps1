$BackupPolicy= New-WBPolicy

#sample location of the folder to be backuped up
$Location= New-WBFileSpec -FileSpec "C:\Datafolder\files\" 

Add-WBFileSpec -Policy $BackupPolicy -FileSpec $Location

#set the destination for the files to be saved.
$Target = New-WBBackupTarget -Volume (Get-WBVolume F:)

Add-WBBackupTarget -Policy $BackupPolicy -Target $Target

#Start the backup
Start-WBBackup -Policy $BackupPolicy