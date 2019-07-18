1. Get the circuit_breaking.yaml file
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/circuit_breaking.yaml`{{execute T1}}

2. Let's look at the Canary.yaml file. Your instructor will talk through the pieces of this file
`vim /root/istio-1.2.2/install/kubernetes/circuit_breaking.yaml`{{execute T4}}

3. Deploy canary services - We Need This to Set privileged access to the Services. Wait for all pods to start.
`istioctl kube-inject -f circuit_breaking.yaml | oc apply -f -`{{execute T1}}
    
    `oc get pods`{{execute T1}}

4. Use Fortio for load testing and benchmarking 
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/fortio.yaml`{{execute T1}}

    `oc apply -f fortio.yaml`{{execute T1}}

4. Test The Application - Hitting from Ingress

`oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -- load -curl http://hello-circuitbreaking:8080`{{execute T1}}

   
   `curl 127.0.0.1:31380 -H "Host: hello-canary.example.com"`{{execute T1}}

5. Change the weight to 50-50 through virtual service

    `vim /root/istio-1.2.2/install/kubernetes/canary.yaml`{{execute T3}}
    
6. Reapply the configuration
`istioctl kube-inject -f canary.yaml | oc apply -f -`{{execute T1}}
    
    `oc get pods`{{execute T1}}

7. Test the traffic shifting
    `curl 127.0.0.1:31380 -H "Host: hello-canary.example.com"`{{execute T1}}