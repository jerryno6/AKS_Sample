# Run these commands to deploy locally
```
#az acr login vule14registry
#docker tag ledangvu/ledangvu_aks_webapp vule14registry.azurecr.io/ledangvu/ledangvu_aks_webapi
#docker push vule14registry.azurecr.io/ledangvu/ledangvu_aks_webapi

git clone https://github.com/jerryno6/AKS_Sample.git
cd AKS_Sample\deploy\localkubernetes\kubctl deployment
chmod 777 localdeploy.sh
./localdeploy.sh
```

# Run these commands to run helm chart
- We are standing at: ./AKS_Sample/deploy/localkubernetes
```
helm install akssample ./akssample
helm list

helm get manifest akssample

kubectl get pods

helm delete akssample
```

