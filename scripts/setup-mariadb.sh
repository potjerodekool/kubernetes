#Create secret for Maria
microk8s kubectl create secret generic maria-secret -n general \
--from-literal=dbpassword=password

#Create persistentVolume and persistentVolumeClaim for Maria
microk8s kubectl apply -f ../persistentvolume/maria-pv.yml

#Create service and deployment for Maria
microk8s kubectl apply -f ../deployment/maria.yml