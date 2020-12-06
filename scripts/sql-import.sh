IP=$(kubectl describe service -n general maria-ext | grep IP: | awk '{print $2;}') 
mysql -uroot -h$IP --port 32306 -ppassword < "$1"
