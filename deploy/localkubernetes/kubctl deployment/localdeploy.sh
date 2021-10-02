
kubectl apply -f ./deployment.yaml
kubectl apply -f ./nodeport.yaml

kubectl wait --for=condition=available --timeout=600s deployment/contoso-website -n default


kubectl get svc
kubectl get pods




