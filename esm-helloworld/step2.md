1. Get the canary.yaml file
`curl -O https://raw.githubusercontent.com/ruifengli-asu/esm/master/examples/canary.yaml`{{execute T1}}

2. Let's look at the Canary.yaml file. Your instructor will talk through the pieces of this file
`cat /root/istio-1.2.2/install/kubernetes/canary.yaml`{{execute T3}}

3. Deploy canary services - We Need This to Set privileged access to the Services. Wait for all pods to start.
`istioctl kube-inject -f canary.yaml | oc apply -f -`{{execute T1}}
    
    `oc get pods`{{execute T1}}

