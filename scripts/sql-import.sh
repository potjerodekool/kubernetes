#IP=$(kubectl describe service -n general maria-ext | grep IP: | awk '{print $2;}')

IP=$(kubectl get endpoints -n general maria-ext -o jsonpath={.subsets[0].addresses[0].ip})

echo "Connect to maria at $IP"

mysql -uroot -h$IP -ppassword < "$1"
