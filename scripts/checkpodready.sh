poll=true

while [ $poll == true ]
do
  RESULT=$(kubectl get pods -n general --field-selector status.phase=Running | grep "$(echo $1)")

  if [[ $RESULT == $1* ]]
  then
    echo "pod is ready"
    poll=false
  fi
done
