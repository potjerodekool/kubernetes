FILE=/usr/local/bin/kubectl

if test -f "$FILE"; then
  echo "kubectl already installend"
else
  echo "Installing kubectl"	
  curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
 chmod +x ./kubectl
 sudo mv ./kubectl /usr/local/bin/kubectl
fi

microk8s config > ~/.kube/config
