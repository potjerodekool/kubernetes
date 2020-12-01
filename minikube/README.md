#Install docker
$ ./install-docker.sh

#Check if docker is working
$ docker --version

#Install minikube
$ ./install-minikube.sh

#Check if minikube is working
$ minikube version

#Install kubectl
$ ./install-kubectl.sh

#Check if kubectl is working
$ kubectl version

kubectl label nodes minikube external-lb=true
kubectl label nodes minikube internal-lb=true
kubectl create --namespace=kube-system secret generic traefik-cert --from-file=system/production/ssl/tls.cert --from-file=system/production/ssl/tls.key