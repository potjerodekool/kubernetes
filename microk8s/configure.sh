sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
microk8s start
microk8s enable ingress dns