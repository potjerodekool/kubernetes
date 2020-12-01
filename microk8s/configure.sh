sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
vi ~/.bash_aliases
alias kubectl="microk8s kubectl"
reboot now
microk8s start
microk8s enable ingress dns
