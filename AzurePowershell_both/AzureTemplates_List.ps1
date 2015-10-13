#
# AzureTemplates_List.ps1
#


# Retrieve all available items - Doesn't work due to json serialization error
#$allGalleryItems = Invoke-WebRequest -Uri "https://gallery.azure.com/Microsoft.Gallery/GalleryItems?api-version=2015-04-01&includePreview=true" | ConvertFrom-Json

# Retrieve most available items
$allGalleryItems = Invoke-WebRequest -Uri "https://gallery.azure.com/Microsoft.Gallery/GalleryItems?api-version=2015-04-01&includePreview=true&`$filter=Publisher eq 'Microsoft'" -UseBasicParsing | ConvertFrom-Json

# Get all items published by Microsoft
$allGalleryItems | Where-Object { $_.PublisherDisplayName -eq "Microsoft" }

# Get all gallery items with "SQL" in the description
$allGalleryItems | Where-Object { $_.Description -match "SQL" }

# Save default template for all items under directory "C:\Templates"
$allGalleryItems | Foreach-Object {
$path = Join-Path -Path "C:\templates" -ChildPath $_.Identity
New-Item -type Directory -Path $path

$_.Artifacts | Where-Object { $_.type -eq "template" } | ForEach-Object {
$templatePath = Join-Path -Path $path -ChildPath ( $_.Name + ".json" )

(Invoke-WebRequest -Uri $_.Uri).Content | Out-File -FilePath $templatePath
}
}