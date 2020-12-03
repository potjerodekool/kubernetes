#Delete configmap
microk8s kubectl delete configmap -n general general-configmap

#Create configmap
microk8s kubectl apply -f ../configmap/configmap.yml