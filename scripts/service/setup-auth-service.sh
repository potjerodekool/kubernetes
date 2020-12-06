#Create JWT secret
## Generate random gerated base64 encoded jwtsecret and store it in the jwt-secret (replace myjwtsecret value)
## For your local cluster just use the value from application.properties
echo $(tr -dc A-Za-z0-9 < /dev/urandom | dd bs=100 count=1 2>/dev/null) | JWT_SECRET_VALUE=$(base64)
kubectl create secret generic jwt-secret -n general --from-literal=jwtsecret='${JWT_SECRET_VALUE}'

#Create secret for auth-server
kubectl create secret generic auth-secret -n general \
--from-literal=dbusername=authentication \
--from-literal=dbpassword=secret

#Deploy auth-server
./sql-import.sh ../database/authentication.sql

kubectl apply -f ../deployment/auth-server.yml
kubectl apply -f ../service/auth-server.yml

#Deploy login-ui
kubectl apply -f ../deployment/login-ui.yml
kubectl apply -f ../service/login-ui.yml

./checkpodready.sh auth-server
./checkpodready.sh login-ui
