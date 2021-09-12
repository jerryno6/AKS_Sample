export LOCATION=southeastasia
export RESOURCE_GROUP=learn-04de4d4b-8b6e-49d4-b2f5-cf29151abeff
export CLUSTER_NAME=aks-contoso-video

#create resources
#az group create -n $RESOURCE_GROUP -l $LOCATION

az aks create \
    --resource-group $RESOURCE_GROUP \
    --name $CLUSTER_NAME \
    --node-count 2 \
    --enable-addons http_application_routing \
    --generate-ssh-keys \
    --node-vm-size Standard_B2s \
    --network-plugin azure

az aks nodepool add \
    --resource-group $RESOURCE_GROUP \
    --cluster-name $CLUSTER_NAME \
    --name userpool \
    --node-count 2 \
    --node-vm-size Standard_B2s

# Link your Kubernetes cluster with kubectl
az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP
kubectl get nodes

# deploy services
kubectl apply -f ./deployment.yaml
kubectl get deploy contoso-website

kubectl apply -f ./service.yaml
kubectl get service contoso-website

#need to get the url of website via below command
: '
az aks show \
  -g $RESOURCE_GROUP \
  -n $CLUSTER_NAME \
  -o tsv \
  --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName
'

#kubectl apply -f ./ingress.yaml
#kubectl get ingress contoso-website