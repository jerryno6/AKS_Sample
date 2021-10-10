export LOCATION=southeastasia
export RESOURCE_GROUP=learn-04de4d4b-8b6e-49d4-b2f5-cf29151abeff
export CLUSTER_NAME=aks-contoso-video
export ACR_NAME=vule14registry
export SERVICE_PRINCIPAL_NAME=vule14acr-service-principal

#az group create -n $RESOURCE_GROUP -l $LOCATION

az acr create -n Vule14Registry -g $RESOURCE_GROUP --sku Standard


# Obtain the full registry ID for subsequent command args
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

# Create the service principal with rights scoped to the registry.
# Default permissions are for docker pull access. Modify the '--role'
# argument value as desired:
# acrpull:     pull only
# acrpush:     push and pull
# owner:       push, pull, and assign roles
SP_PASSWD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query password --output tsv)
SP_APP_ID=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query [].appId --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "Service principal ID: $SP_APP_ID"
echo "Service principal password: $SP_PASSWD"