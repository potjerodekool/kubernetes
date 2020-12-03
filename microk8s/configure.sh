sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
echo "alias kubectl='microk8s kubectl'" >> ~/.bash_aliases
su - $USER
microk8s start
microk8s enable ingress dns