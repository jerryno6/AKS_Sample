# Run these commands to run helm chart
- We are standing at: ./AKS_Sample/deploy/localkubernetes
```
helm install akssample ./akssample
helm list

helm get manifest akssample

kubectl get pods

helm delete akssample
```