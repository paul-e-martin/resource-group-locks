[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $resourceGroupName,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $storageAccountName,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $container,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $key
)

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName)[0].Value
$ctx = New-AzStorageContext -StorageAccountName  $storageAccountName -StorageAccountKey $storageAccountKey
$file = Get-AzStorageBlobContent -Container $container -Blob $key -Context $ctx -Force
$content = Get-Content -Path $file.Name | ConvertFrom-Json
$rgs = $content.outputs.resource_groups.value

# get all subscriptions
$subscriptions = @()
foreach ($rg in $rgs) {
    $subscriptions += $rg.id.split('/')[2]
}

# dynamically create the providers
$providers = Get-Content -Path ".\providers.txt"

foreach ($subscription in ($subscriptions | Select-Object -Unique)) {
    $text = @"
provider "azurerm" {
    alias = "sub-$($subscription)"
    subscription_id = "$($subscription)"
    features {}
}

"@
    $providers += $text
}
$providers | Out-File -FilePath "providers.tf" -Force

# dynamically create resource block
$main = Get-Content -Path ".\main.txt"

$newMain = @()
foreach ($subscription in ($subscriptions | Select-Object -Unique)) {
    $newMain += $main.Replace("__landing_zone_subscription_id__", $subscription)
}

$newMain | Out-File -FilePath ".\main.tf" -Force
