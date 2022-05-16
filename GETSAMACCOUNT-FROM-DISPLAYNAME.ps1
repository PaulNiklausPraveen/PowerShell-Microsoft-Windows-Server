$displayname = (Import-CSV C:\Temp\Displayname.csv).displayname
$path ="C:\Temp\Samaccountname.csv"

foreach($name in $displayname)
{

Get-ADUser -Filter "displayname -eq '$($name)'" -Properties *  | Select name,samaccountname,mail | export-csv Path -NoTypeInformation -Encoding UTF8 -Append 

}
 
