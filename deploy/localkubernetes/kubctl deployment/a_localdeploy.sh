#Apply deployment
kubectl apply -f ./deployment.yaml
kubectl wait --for=condition=available --timeout=600s deployment/contoso-website -n default

kubectl apply -f ./service.yaml

kubectl get svc
kubectl get pods

# Clean up
# kubectl delete svc,deployment contoso-website
# kubectl scale --replicas=1 deployment/contoso-website
# kubectl get deployment

#go to http://localhost:8080 to see the result