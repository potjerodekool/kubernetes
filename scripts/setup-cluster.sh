#Install kubectl
./install-kubectl.sh

#Create general namespace if not exists
NS_RESULT=$(kubectl get namespace | grep "general")
if [[ $NS_RESULT != general*]]
  kubectl create -f ../namespace/namespace-general.json
then
fi

#Setup configmap
./setup-configmap.sh

##Apply the ingress
./apply-ingress.sh