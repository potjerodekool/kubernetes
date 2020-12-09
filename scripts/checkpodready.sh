poll=true

while [ $poll == true ]
do
  echo "Waiting for pod $1"
  sleep 5
  RESULT=$(kubectl get pods -n general --field-selector status.phase=Running | grep "$(echo $1)")

  if [[ $RESULT == $1* ]]
  then
    echo "pod is ready"
    poll=false
  fi
done
