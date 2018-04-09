Login-AzureRmAccount

$resourceGroupName = "fta-fun-instances-rg"
$resourceGroupLocation = "North Europe"
New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "01-TemplateCopyParallel.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "02-TemplateCopySerial.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "03-TemplateCopyArrays.json" -TemplateParameterFile "03-TemplateCopyArrays.parameters.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile "04-TemplateCopyChildResources.json" -TemplateParameterFile "04-TemplateCopyChildResources.parameters.json"
