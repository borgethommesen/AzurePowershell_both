#Subscription : 53840dfa-bf87-4601-ae1f-65d802f86913
#Tenants      : 433a23bd-65e4-4e74-ae5f-d64486ac697d


#Get-Command -Module AzureResourceManager | Get-Help | Format-Table Name, Synopsis
Remove-AzureAccount

Get-AzureAccount

Add-AzureAccount

Get-AzureResourceGroupGalleryTemplate -Publisher Microsoft

Save-AzureResourceGroupGalleryTemplate -Identity Microsoft.WebSiteSQLDatabase.0.2.6-preview -Path "C:\Users\both\documents\visual studio 2015\Projects\AzurePowershell_both\AzurePowershell_both\New_WebSite_And_Database.json"

Get-AzureResourceGroupGalleryTemplate -Identity Microsoft.WebSiteSQLDatabase.0.2.6-preview -version "2015-10-01"

