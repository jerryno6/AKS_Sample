#Apply deployment
kubectl apply -f ./deployment.yaml
kubectl wait --for=condition=available --timeout=600s deployment/contoso-website -n default

kubectl apply -f ./service.yaml

kubectl get svc
kubectl get pods

# Clean up
# kubectl delete svc contoso-website
# kubectl delete deployment contoso-website



