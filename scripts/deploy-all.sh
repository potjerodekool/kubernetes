./setup-cluster.sh
./setup-mariadb.sh
./setup-configmap.sh
./apply-ingress.sh
./service/setup-auth-service.sh
./service/setup-integrator-service.sh

kubectl delete endpoints -n general maria-ext
