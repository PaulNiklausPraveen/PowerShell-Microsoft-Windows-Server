#To get version id to recover the file
Get-WBBackupSet

$myBackup = Get-WBBackupSet | Where-Object VersionId -eq 06/03/2022-19:14

#To restore the particular file
Start-WBFileRecovery -BackupSet $myBackup -SourcePath  "C:\Datafolder\File.txt"  -TargetPath "C:\Temp\RecoveredData\" -Force

#To restore the entire folder
Start-WBFileRecovery -BackupSet $myBackup -SourcePath "C:\Datafolder\"  -Recursive -TargetPath "C:\Temp\RecoveredData\" -Force
