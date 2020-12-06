#Install kubectl
./scripts/install-kubectl.sh

#Create general namespace
kubectl create -f ../namespace/namespace-general.json

#setup maria
./scripts/setup-mariadb.sh

#Setup configmap
./scripts/setup-configmap.sh

##Apply the ingress
./scripts/apply-ingress.sh