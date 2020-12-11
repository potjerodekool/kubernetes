#Create secret for Maria
kubectl create secret generic maria-secret -n general \
--from-literal=dbpassword=password

#Create persistentVolume and persistentVolumeClaim for Maria
kubectl apply -f ../persistentvolume/maria-pv.yml

#Create service and deployment for Maria
kubectl apply -f ../deployment/maria.yml

#Wait until maria pod is ready
./checkpodready.sh maria

poll=true

while [ $poll == true ]
do
  echo "Waiting maria endpoint $1"
  sleep 5
  RESULT=$(kubectl get endpoints -n general | grep "maria")

  if [[ $RESULT == maria* ]]
  then
    echo "maria endpoint is ready"
    poll=false
  fi
done

#Install maria client
sudo apt install mariadb-client-core-10.3 -y