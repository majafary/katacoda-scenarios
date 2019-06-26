You need to create a pod and a service, use two files pod.yaml and service.yaml

1. First verify the content of the pod.yaml and service.yaml

    `cat pod.yaml`{{execute T1}}

    `cat service.yaml`{{execute T1}}

2. create the service and pod using the kubectl command.

    ``kubectl apply -f pod.yaml``{{execute T1}}

    ``kubectl apply -f service.yaml``{{execute T1}}
3. If you see any problem then fix it by issuing below command.

    ``vi pod.yaml``{{execute T1}}

    ``vi service.yaml``{{execute T1}}
4. verify if the pods are create and running.
5. verify if the services are created and running.
6. try to `curl` the service, you should see hello world on console.