export LOCATION=southeastasia
export RESOURCE_GROUP=learn-04de4d4b-8b6e-49d4-b2f5-cf29151abeff
export CLUSTER_NAME=aks-contoso-video

#az group create -n $RESOURCE_GROUP -l $LOCATION

az acr create -n VuleRegistry -g $RESOURCE_GROUP --sku Standard