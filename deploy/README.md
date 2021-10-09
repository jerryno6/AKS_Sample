# Run these commands to deploy locally
```
az login

git clone https://github.com/jerryno6/AKS_Sample.git
cd AKS_Sample\deploy\localkubernetes\kubctl deployment
chmod 777 localdeploy.sh

kubectl create secret docker-registry acr-secret \
    --namespace default \
    --docker-server=vule14registry.azurecr.io \
    --docker-username=2b1c8fc7-1246-4f8c-a54e-0f82ba1be14a \
    --docker-password=KHSmuNNZadK4duUVUGPAbRDvNOUV

./localdeploy.sh
kubectl get svc


#  kubectl delete all -l app=contoso-website
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

