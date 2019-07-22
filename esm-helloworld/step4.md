1. Get the rate_limiting.yaml file
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/rate_limiting.yaml`{{execute T1}}



`istioctl kube-inject -f helloworld.yaml | oc apply -f -`{{execute T1}}


2. Let's look at the Canary.yaml file. Your instructor will talk through the pieces of this file
`vim /root/istio-1.2.2/install/kubernetes/rate_limiting.yaml`{{execute T5}}

3. Deploy Rate Limit Configuration
`oc apply -f rate_limiting.yaml`{{execute T1}}

4. Verify the configuration is deployed(Optional)
    
    `oc get pods`{{execute T1}}
    
    `oc get handler -n istio-system`{{execute T1}}
    
    `oc get instance -n istio-system`{{execute T1}}
    
    `oc get QuotaSpec -n istio-system`{{execute T1}}
    
    `oc get QuotaSpecBinding -n istio-system`{{execute T1}}
    
    `oc get rule -n istio-system`{{execute T1}}
    
5. We will deploy the micro-services 

https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/helloworld.yaml


5. Use Fortio to test The Application up and running - One Request

    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}') -c fortio /usr/bin/fortio  -- load -curl http://hello:8080`{{execute T1}}

6. Use Fortio to test The Application up and running - One Concurrent Request for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 1 -qps 0 -n 20 --loglevel Warning http://hello:8080`{{execute T1}}

7. Use Fortio to test The Application up and running - 5 Concurrent Requests for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 5 -qps 0 -n 20 --loglevel Warning http://hello-circuitbreaking:8080`{{execute T1}}


