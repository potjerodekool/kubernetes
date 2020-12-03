#Delete configmap
kubectl delete configmap -n general general-configmap

#Create configmap
kubectl apply -f ../configmap/configmap.yml