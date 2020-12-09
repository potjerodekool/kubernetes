kubectl create secret generic integrator-secret -n general \
--from-literal=dbusername=intergrator \
--from-literal=dbpassword=secret

#Deploy integrator
./sql-import.sh ../database/integrations.sql

kubectl apply -f ../deployment/integrator.yml
kubectl apply -f ../service/integrator.yml

kubectl apply -f ../deployment/dashboard-ui.yml
kubectl apply -f ../service/dashboard-ui.yml

./checkpodready.sh integrator-server
./checkpodready.sh dashboard-ui
