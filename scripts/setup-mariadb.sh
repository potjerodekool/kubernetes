#Create secret for Maria
kubectl create secret generic maria-secret -n general \
--from-literal=dbpassword=password

#Create persistentVolume and persistentVolumeClaim for Maria
kubectl apply -f ../persistentvolume/maria-pv.yml

#Create service and deployment for Maria
kubectl apply -f ../deployment/maria.yml

#Wait until maria pod is ready
./checkpodready.sh maria

#Install maria client
sudo apt install mariadb-client-core-10.3

#Login to maria
#mysql -uroot -h192.168.178.206 --port 32306 -psecret