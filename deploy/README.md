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
kubectl get pods

#  kubectl delete all -l app=contoso-website
```

# Run these commands to install helm chart

### Install helm chart
- We are standing at: ./AKS_Sample/deploy/localkubernetes/helm
```
helm install contoso-website ./contoso-website
helm list

helm get manifest contoso-website

kubectl get pods
```

### Upgrade helm chart
```
helm history drone-webapp

# edit the chart then run this command
helm upgrade drone-webapp ./drone-webapp-chart
helm history drone-webapp
```

### clean up helm
```
helm delete contoso-website
```