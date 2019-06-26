You need to create a pod and a service, use two files pod.yaml and service.yaml

1. First verify the content of the pod.yaml and service.yaml

    `cat pod.yaml`{{execute T1}}

    `cat service.yaml`{{execute T1}}


2. If you find any problem in any of the files, then fix it by editing those files.

    ``vi pod.yaml``{{execute T1}}

    ``vi service.yaml``{{execute T1}}
3. Create the service and pod using the kubectl command.

    ``kubectl apply -f pod.yaml``{{execute T1}}

    ``kubectl apply -f service.yaml``{{execute T1}}

4. Verify if the services and container are created and running.
5. try to `curl` the service, you should see <B>hello world</B> on console.