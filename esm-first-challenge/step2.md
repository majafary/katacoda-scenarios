You need to create a pod and a service, use two files pod.yaml and service.yaml

1. Verify if pod.yaml and service.yaml is present in your current directory.
    `ls -ltr `{{execute T1}}

2. Check the content of the pod.yaml and service.yaml
    
    see content of pod.yaml : `cat pod.yaml`{{execute T1}}

    see content of service.yaml : `cat service.yaml`{{execute T1}}


3. If you find any problem in any of the files, then fix it by editing those files.

    Edit pod.yaml : ``vi pod.yaml``{{execute T1}}

    Edit service.yaml : ``vi service.yaml``{{execute T1}}

4. Create the service and pod using the kubectl command.

    create POD: ``kubectl apply -f pod.yaml``{{execute T1}}

    Create Service: ``kubectl apply -f service.yaml``{{execute T1}}

5. Check if pod and service is running.

    ``kubectl get pods``{{execute T1}}

    ``kubectl get svc``{{execute T1}}

6. Access the service using `curl` command, the output should be <B>hello world!</B>.