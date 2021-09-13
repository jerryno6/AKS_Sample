#export LOCATION=southeastasia
export RESOURCE_GROUP=learn-8cd0fbb4-4525-4313-874e-bf26245d33cd
export CLUSTER_NAME=aks-contoso-video

#create resources
#az group create -n $RESOURCE_GROUP -l $LOCATION
sleep 1m

az aks create \
    --resource-group $RESOURCE_GROUP \
    --name $CLUSTER_NAME \
    --node-count 2 \
    --enable-addons http_application_routing \
    --generate-ssh-keys \
    --node-vm-size Standard_B2s \
    --network-plugin azure

sleep 1m

az aks nodepool add \
    --resource-group $RESOURCE_GROUP \
    --cluster-name $CLUSTER_NAME \
    --name userpool \
    --node-count 2 \
    --node-vm-size Standard_B2s

sleep 1m

# Link your Kubernetes cluster with kubectl
az aks get-credentials --name $CLUSTER_NAME --resource-group $RESOURCE_GROUP
sleep 2m
kubectl get nodes

# deploy services
kubectl apply -f ./deployment.yaml
sleep 2m
kubectl get deploy contoso-website

kubectl apply -f ./service.yaml
sleep 2m
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