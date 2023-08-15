#This PowerShell script will install windows updates


$TodayDate= Get-Date -format "dd-MMM-yyyy HH:mm tt"  
New-Item -Path C:\ -Name "PatchLogs" -ItemType "directory" -ErrorAction SilentlyContinue
$Path="C:\PatchLogs\Patch.txt"
Start-Transcript $Path
#Install PS Module if not installed
If(!(Get-Module PSWindowsUpdate))
{  
"$TodayDate : Installing PSWindowsUpdate"  
Install-Module PSWindowsUpdate  -Scope CurrentUser -Force -AllowClobber -Verbose
}
"`n $TodayDate : Importing PSWindowsUpdate Powershell module `n"  


Import-Module PSWindowsUpdate -Force -Verbose

 
"$TodayDate : Available Updates"  
 

Get-WindowsUpdate | FT
 

"$TodayDate : Installing above Updates"   

 

Get-WindowsUpdate -AcceptAll -Install -AutoReboot

 

Stop-Transcript
