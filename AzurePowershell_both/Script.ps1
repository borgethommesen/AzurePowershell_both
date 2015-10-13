#
# BOTH_Azure_Deployment.ps1
#
# Powershell script for Azure Deployment
# Todo: Use ARM Template(s)

#VARIABLE DECLARATION
$subscriptionName = "Visual Studio Premium med MSDN"
$defaultLocation = "West Europe"
$websiteName = "BOTH_AT-DEV"
$storageAccount = "bothatdev" #naming standard : lower case
$serviceBusNameSpace = "BOTH_AT-DEV"
$loggingBusNameSpace = "BOTH_Bus-DEV"
$resourceGroupName = "BOTH_RG_WE"
$deploymentName = "BOTH_AT_Deployment"

##First create resources using the resource manager
Switch-AzureMode AzureResourceManager
Select-AzureSubscription -SubscriptionName $subscriptionName

#BOTH debug - Add AzureAccount
Add-AzureAccount 
#BOTH debug end

#ADD RESOURCEGROUP
New-AzureResourceGroup -Name $resourceGroupName -Location $defaultLocation
#Remove-AzureResourceGroup -Name $resourceGroupName

##CREATE STORAGEACCOUNT
New-AzureStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccount -Location $defaultLocation -Type Standard_LRS
$storageKey = (Get-AzureStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccount).Key1
$storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=$storageAccount;AccountKey=$storageKey"

# Adding StorageAccount using template and parameterfile
New-AzureResourceGroupDeployment -Name $deploymentName  -ResourceGroupName $resourceGroupName -TemplateParameterFile ..\Both_Deploy.Param.json -TemplateFile ..\Both_Deploy.json
# -TemplateUri https://raw.githubusercontent.com/azure/azure-quickstart-templates/master/101-create-storage-account-standard/azuredeploy.json




##CREATE WEBSITE
$serverFarm = Get-AzureResource -ResourceName $appPlan -OutputObjectFormat New
$propertyObject = @{"serverFarmId" = $serverFarm.ResourceId}

New-AzureResource -Name $websiteName `
    -Location $defaultLocation `
    -ResourceGroupName $resourceGroupName `
    -ResourceType 'Microsoft.Web/sites' `
    -PropertyObject $propertyObject

# BOTH debug - AlwaysOn = $false instead of AlwaysOn = $true
#Set-AzureResource -PropertyObject @{"siteConfig" = @{"AlwaysOn" = $true}} -Name $websiteName -ResourceGroupName $resourceGroupName -ResourceType Microsoft.Web/sites -OutputObjectFormat New
Set-AzureResource -PropertyObject @{"siteConfig" = @{"AlwaysOn" = $false}} -Name $websiteName -ResourceGroupName $resourceGroupName -ResourceType Microsoft.Web/sites -OutputObjectFormat New
# BOTH debug - end


##Do the rest of the stuff from Service Manager
Switch-AzureMode AzureServiceManagement
Select-AzureSubscription -SubscriptionName $subscriptionName

##GET LOGGING BUS
$loggingBusConnectionString = (Get-AzureSBNamespace -Name $loggingBusNameSpace).ConnectionString

##CREATE SERVICE BUS
New-AzureSBNamespace -Name $serviceBusNameSpace -Location $defaultLocation -NamespaceType Messaging

#CONFIGURE WEBSITE
$applicatonSettings = @{"WEBSITE_NODE_DEFAULT_VERSION" = "0.10.32";
			"MyAppSettings" ="tmp"}
                        
Set-AzureWebsite $websiteName -AppSettings $applicatonSettings

#ADD CONNECTION STRINGS TO WEBSITE
$serviceBusConnectionString = (Get-AzureSBNamespace -Name $serviceBusNameSpace).ConnectionString
$connStrings = (Get-AzureWebsite $websiteName).ConnectionStrings

$newConnString = New-Object Microsoft.WindowsAzure.Commands.Utilities.Websites.Services.WebEntities.ConnStringInfo
$newConnString.Name = "ReferenceMessagesStorage"
$newConnString.ConnectionString = $storageConnectionString
$newConnString.Type = "Custom"
$connStrings.Add($newConnString)

$newConnString = New-Object Microsoft.WindowsAzure.Commands.Utilities.Websites.Services.WebEntities.ConnStringInfo
$newConnString.Name = "AzureWebJobsServiceBus"
$newConnString.ConnectionString = $serviceBusConnectionString
$newConnString.Type = "Custom"
$connStrings.Add($newConnString)

$newConnString = New-Object Microsoft.WindowsAzure.Commands.Utilities.Websites.Services.WebEntities.ConnStringInfo
$newConnString.Name = "AzureWebJobsStorage"
$newConnString.ConnectionString = $storageConnectionString
$newConnString.Type = "Custom"
$connStrings.Add($newConnString)

$newConnString = New-Object Microsoft.WindowsAzure.Commands.Utilities.Websites.Services.WebEntities.ConnStringInfo
$newConnString.Name = "AzureWebJobsDashboard"
$newConnString.ConnectionString = $storageConnectionString
$newConnString.Type = "Custom"
$connStrings.Add($newConnString)

$newConnString = New-Object Microsoft.WindowsAzure.Commands.Utilities.Websites.Services.WebEntities.ConnStringInfo
$newConnString.Name = "Log4netServiceBusConnection"
$newConnString.ConnectionString = $loggingBusConnectionString
$newConnString.Type = "Custom"
$connStrings.Add($newConnString)

Set-AzureWebsite $websiteName -ConnectionStrings $connStrings


