git clone https://github.com/jerryno6/AKS_Sample.git
git checkout develop

# build & push for reactapp
cd ./src/Clients/reactapp
docker build -t ledangvu/ledangvu_aks_reactapp:latest .
docker push ledangvu/ledangvu_aks_reactapp:latest

# build & push for nodeapi
cd ./src/Services/NodeBackend
docker build -t ledangvu/ledangvu_aks_nodeapi:latest .
docker push ledangvu/ledangvu_aks_nodeapi:latest

# build & push for webapp
cd ./src/Clients/AKS_Sample.Client.WebApplication
docker build -t ledangvu/ledangvu_aks_webapp:latest .
docker push ledangvu/ledangvu_aks_webapp:latest

# build & push for webapi
cd src/Services/WebApi
docker build -t ledangvu/ledangvu_aks_webapi:latest .
docker push ledangvu/ledangvu_aks_webapi:latest

# build & push for  gprc
cd src/Services/AKS_Sample.Services.GreetService
docker build -t ledangvu/ledangvu_aks_grpc:latest .
docker push ledangvu/ledangvu_aks_gprc:latest

# push it to Azure  acr
# you might need service principal credential to login acr, to reset credential, use command `az ad sp credential reset --name APP_ID``
#{
#  "appId": "7b8c8fc7-1246-4f8c-a54e-0f82ba1be14a",
#  "displayName": "ServicePrincipalName",
#  "name": "7b8c8fc7-1246-4f8c-a54e-0f82ba1be14a",
#  "password": "BLv.yPKHSmuNNZadK4duUVUGPAbRDvNAAA",  -- the password has been changed
#  "tenant": "61a34ea2-8a35-416e-af85-731e24572b82"
#}
# you might need to login using #az acr login --name vule14registry
docker tag ledangvu/ledangvu_aks_webapp:latest vule14registry.azurecr.io/ledangvu/ledangvu_aks_webapp:latest
docker push vule14registry.azurecr.io/ledangvu/ledangvu_aks_webapp:latest

docker tag ledangvu/ledangvu_aks_webapp:latest vule14registry.azurecr.io/ledangvu/ledangvu_aks_reactapp:latest
docker push vule14registry.azurecr.io/ledangvu/ledangvu_aks_reactapp:latest

docker tag ledangvu/ledangvu_aks_webapp:latest vule14registry.azurecr.io/ledangvu/ledangvu_aks_nodeapi:latest
docker push vule14registry.azurecr.io/ledangvu/ledangvu_aks_nodeapi:latest

docker tag ledangvu/ledangvu_aks_webapi:latest vule14registry.azurecr.io/ledangvu/ledangvu_aks_webapi:latest
docker push vule14registry.azurecr.io/ledangvu/ledangvu_aks_webapi:latest

docker tag ledangvu/ledangvu_aks_grpc:latest vule14registry.azurecr.io/ledangvu/ledangvu_aks_grpc:latest
docker push vule14registry.azurecr.io/ledangvu/ledangvu_aks_grpc:latest

