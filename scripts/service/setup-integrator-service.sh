microk8s kubectl create secret generic integrator-secret -n general \
--from-literal=dbusername=intergrator \
--from-literal=dbpassword=secret

#Deploy integrator
#database/integrations.sql
microk8s kubectl apply -f ../../deployment/integrator.yml
microk8s kubectl apply -f ../../service/integrator.yml