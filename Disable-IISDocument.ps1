<#
This PowerShell Script will Disable the default document feature to address a vulnerability
REF Link : https://knowledge.broadcom.com/external/article/205141/disable-the-default-page-in-iis.html 
#>

Function Disable-IISDefaultDocument{
Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.webServer/defaultDocument" -name "enabled" -value "False"

$Documentstatus=(Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.webServer/defaultDocument" -name "enabled").Value

""| Select @{N="ServerName";E={$Env:COMPUTERNAME}},@{N="DefaultDocumentEnabled";E={$Documentstatus}} 
}
