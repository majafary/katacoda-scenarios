1. Get the circuit_breaking.yaml file
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/circuit_breaking.yaml`{{execute T1}}

2. Let's look at the Canary.yaml file. Your instructor will talk through the pieces of this file
`vim /root/istio-1.2.2/install/kubernetes/circuit_breaking.yaml`{{execute T4}}

3. Deploy canary services - We Need This to Set privileged access to the Services. Wait for all pods to start.
`istioctl kube-inject -f circuit_breaking.yaml | oc apply -f -`{{execute T1}}
    
    `oc get pods`{{execute T1}}

4. Install Fortio for load testing and benchmarking 
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/fortio.yaml`{{execute T1}}

    `oc apply -f fortio.yaml`{{execute T1}}
    
    `oc get pods`{{execute T1}}

5. Use Fortio to test The Application up and running - One Request

    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}') -c fortio /usr/bin/fortio  -- load -curl http://hello-circuitbreaking:8080`{{execute T1}}


6. Use Fortio to test The Application up and running - One Concurrent Request for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 1 -qps 0 -n 20 --loglevel Warning http://hello-circuitbreaking:8080`{{execute T1}}
