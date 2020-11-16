#Enable add-ons
microk8s enable ingress dns

#Create general namespace
kubectl create -f namespace/namespace-general.json

#Create secret for Maria
kubectl create secret generic maria-secret -n general \
--from-literal=dbpassword=username

#Create persistentVolume and persistentVolumeClaim for Maria
kubectl apply -f persistentvolume/maria-pv.yml

#Create service and deployment for Maria
kubectl apply -f deployment/maria.yml

#Create secret for auth-server
kubectl create secret generic auth-secret -n general \
--from-literal=dbusername=username \
--from-literal=dbpassword=secret \
--from-literal=login.url=http://192.168.178.122/login

#Deploy auth-server
kubectl apply -f deployment/auth-server
kubectl apply -f service/auth-server.yml

#Setup login-ui
kubectl apply -f deployment/login-ui.yml
kubectl apply -f service/login-ui.yml

