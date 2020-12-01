#Create general namespace
kubectl create -f namespace/namespace-general.json

#Create secret for Maria
kubectl create secret generic maria-secret -n general \
--from-literal=dbpassword=password

#Create persistentVolume and persistentVolumeClaim for Maria
kubectl apply -f persistentvolume/maria-pv.yml

#Create service and deployment for Maria
kubectl apply -f deployment/maria.yml

#Expose maria deployment
kubectl expose deployment -n general maria --type=LoadBalancer --name=maria-ext
#Get external port and ip address that can be used to access maria from outside the cluster
kubectl get services -n general maria-ext
ip address show

#Create JWT secret
## Generate random gerated base64 encoded jwtsecret and store it in the jwt-secret (replace myjwtsecret value)
## For your local cluster just use the value from application.properties
echo $(tr -dc A-Za-z0-9 < /dev/urandom | dd bs=100 count=1 2>/dev/null) | base64
kubectl create secret generic jwt-secret -n general --from-literal=jwtsecret='myjwtsecret'

#Create secret for auth-server
kubectl create secret generic auth-secret -n general \
--from-literal=dbusername=authentication \
--from-literal=dbpassword=secret

kubectl create secret generic integrator-secret -n general \
--from-literal=dbusername=intergrator \
--from-literal=dbpassword=secret

#Create configmap
kubectl apply -f configmap/configmap.yml 

#Deploy auth-server
database/authentication.sql
kubectl apply -f deployment/auth-server
kubectl apply -f service/auth-server.yml

#Deploy login-ui
kubectl apply -f deployment/login-ui.yml
kubectl apply -f service/login-ui.yml

#Deploy integrator
database/integrations.sql
kubectl apply -f deployment/integrator.yml
kubectl apply -f service/integrator.yml

#Apply ingress
kubectl apply -f ingress/ingress.yaml
