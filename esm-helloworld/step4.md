
1. Download new micro-services yaml 
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/helloworld.yaml`{{execute T1}}

2. Let's look at the helloworld.yaml file. Your instructor will talk through the pieces of this file
`vim /root/istio-1.2.2/install/kubernetes/helloworld.yaml`{{execute T5}}

3. Deploy micro-services with sidecar envoy proxy injected in the same pod

    `istioctl kube-inject -f helloworld.yaml | oc apply -f -`{{execute T1}}

    Validated deployment status

    `oc get pods`{{execute T1}}
    
4. Download the rate_limiting.yaml file
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/rate_limiting.yaml`{{execute T1}}

5. Let's look at the rate_limiting.yaml file. Your instructor will talk through the pieces of this file
`vim /root/istio-1.2.2/install/kubernetes/rate_limiting.yaml`{{execute T6}}

6. Deploy Rate Limit Configuration
`oc apply -f rate_limiting.yaml`{{execute T1}}

7. Verify the configuration is deployed(Optional)
    
    `oc get pods`{{execute T1}}
    
    `oc get handler -n istio-system`{{execute T1}}
    
    `oc get instance -n istio-system`{{execute T1}}
    
    `oc get QuotaSpec -n istio-system`{{execute T1}}
    
    `oc get QuotaSpecBinding -n istio-system`{{execute T1}}
    
    `oc get rule -n istio-system`{{execute T1}}    

8. Use Fortio to test The Application up and running - One Request

    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}') -c fortio /usr/bin/fortio  -- load -curl http://hello:8080`{{execute T1}}

6. Use Fortio to test The Application up and running - One Concurrent Request for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 1 -qps 0 -n 20 --loglevel Warning http://hello:8080`{{execute T1}}

7. Use Fortio to test The Application up and running - 5 Concurrent Requests for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 5 -qps 0 -n 20 --loglevel Warning http://hello:8080`{{execute T1}}
    
8. Change the configuration

    `vim /root/istio-1.2.2/install/kubernetes/rate_limiting.yaml`{{execute T6}}

9. Test again

    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}') -c fortio /usr/bin/fortio  -- load -curl http://hello:8080`{{execute T1}}

10. Use Fortio to test The Application up and running - One Concurrent Request for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 1 -qps 0 -n 20 --loglevel Warning http://hello:8080`{{execute T1}}

11. Use Fortio to test The Application up and running - 5 Concurrent Requests for 20 requests
   
    `oc exec -it $(oc get pods -l app=fortio -o jsonpath='{.items[0].metadata.name}')  -c fortio /usr/bin/fortio -- load -c 5 -qps 0 -n 20 --loglevel Warning http://hello:8080`{{execute T1}}
    
