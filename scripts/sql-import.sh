IP=$(kubectl describe service -n general maria-ext | grep IP: | awk '{print $2;}')

kubectl get endpoints -n general maria-ext -o jsonpath={.subsets[0].addresses[0].ip}

mysql -uroot -h$IP --port 32306 -ppassword < "$1"
