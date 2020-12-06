#Install microk8s.
$ ./microk8s/install.sh

#Start microk8s.
$ ./miroks8/start.sh

#Setup cluster.
$ ./scripts/setup-cluster.sh

#Login to maria pod.
$ ./scripts/login-maria-pod.sh

#Connect to maria.
$ mysql -psecret

#Run sql scripts.
Exeecute the commands in the database scripts below ./database

#Deploy the authentication service (both backend and frontend).
./service/setup-auth-service.sh

#Deploy the integrator service (both backend and frontend).
./service/setup-integrator-service.sh