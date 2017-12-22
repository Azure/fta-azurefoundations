Login-AzureRmAccount

$resourceGroupName = "fta-fun-vnet-rg"
New-AzureRmResourceGroup -Name $resourceGroupName -Location "North Europe"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental -TemplateFile "02-functions.json" -TemplateParameterFile "02-functions.parameters.json"