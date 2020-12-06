POD_NAME=$(kubectl get pods -n general -o jsonpath='{.items[*].metadata.name}' | grep maria
kubectl exec -it $POD_NAME -n general -- sh