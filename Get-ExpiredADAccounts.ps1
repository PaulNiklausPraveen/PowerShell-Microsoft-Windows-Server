#Enter your domain,for example purpose we have given company.local
$OUPath ="company.local"  

#Enter your time span.Here we have given 3 days,
$Timespan = "03:00:00:00" 

#Enter your path to save the CSV file,
$Path="C:\Temp\ExpiredADAccounts.csv"

Search-ADAccount -AccountExpiring -SearchBase "OUPath" -UsersOnly -TimeSpan $timespan | select name,samaccountname,AccountExpirationdate,userprincipalname | Export-CSV $path -notypeinformation -Encoding UTF8