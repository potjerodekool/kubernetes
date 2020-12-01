#!/bin/bash
#Create secret for Maria
kubectl create secret generic maria-secret -n general \
--from-literal=dbpassword=password

#Create persistentVolume and persistentVolumeClaim for Maria
kubectl apply -f persistentvolume/maria-pv.yml

#Create service and deployment for Maria
kubectl apply -f deployment/maria.yml