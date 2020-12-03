kubectl create secret generic integrator-secret -n general \
--from-literal=dbusername=intergrator \
--from-literal=dbpassword=secret

#Deploy integrator
#database/integrations.sql
kubectl apply -f ../../deployment/integrator.yml
kubectl apply -f ../../service/integrator.yml