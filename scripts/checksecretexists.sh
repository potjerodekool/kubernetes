RESULT=$(kubectl get secret -n general | grep "$1")

if [[ $RESULT == $1* ]]
then
  echo "true"
else
  echo "false"
fi

