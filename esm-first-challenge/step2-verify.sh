curl $(kubectl get service | grep 'hello-service' | awk '{print $3}') > test.txt

(( $(cat test.txt | wc -w) == 2 )) && export pass=true
echo done