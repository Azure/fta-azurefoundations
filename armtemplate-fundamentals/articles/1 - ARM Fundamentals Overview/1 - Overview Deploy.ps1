Login-AzureRmAccount

$resourceGroupName = "fta-fun-armtemp-rg2"
New-AzureRmResourceGroup -Name $resourceGroupName -Location "UK West"

#First show the incremental mode of deploying. Once complete, uncomment line 13. - show the rg in the portal
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental -TemplateFile "azuredeploy.json" -TemplateParameterFile "azuredeploy.parameters.json" 

#Next show the incremental mode of deploying with an additional resource. Once complete, uncomment out line 15 and comment line 9 - show the rg in the portal
#New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Incremental -TemplateFile "azuredeploy.json" -TemplateParameterFile "azuredeploy2.parameters.json" 

#Lastly  show the complete mode of deploying - show the rg in the portal. 
#New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -Mode Complete -TemplateFile "azuredeploy.json" -TemplateParameterFile "azuredeploy.parameters.json"
