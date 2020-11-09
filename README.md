#Enable add-ons
microk8s enable ingress dns

#Create secret for auth-server
kubectl create secret generic auth-secret --from-literal=username=myusername --from-literal=password=secret


