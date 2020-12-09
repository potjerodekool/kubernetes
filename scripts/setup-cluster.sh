#Install kubectl
./install-kubectl.sh

#Create general namespace
kubectl create -f ../namespace/namespace-general.json

#setup maria
./setup-mariadb.sh

#Setup configmap
./setup-configmap.sh

##Apply the ingress
./apply-ingress.sh