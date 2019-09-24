1. Create New Project
Execute: `oc new-project myproject`{{execute T1}}
 
2. Download istio
`curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.2.2 sh -`{{execute T1}}

    Go to the directory with YAML files
    `cd istio-1.2.2/install/kubernetes/`{{execute T1}}

3. Install Istio Control Plane Components
`oc apply -f istio-demo.yaml`{{execute T1}}

4. Set ISTIO_HOME to the folder where Istio was installed
`export ISTIO_HOME="/root/istio-1.3.0"`{{execute T1}}

5. Add the bin folder to the PATH
`export PATH=$PATH:$ISTIO_HOME/bin`{{execute T1}}

6. List Istio Control Plane Pods. Wait for the all the istio pods to come up. This may take a couple minutes minutes. You can use the -w flag to watch the progress of pods. Once all pods are created, exit using CTRL+C
`oc get pods -n istio-system`{{execute T1}}
  
7. Get the helloworld-minishift.yaml file
`curl -O https://raw.githubusercontent.com/majafary/archcon/master/helloworld-minishift.yaml`{{execute T1}}

8. Install vim first`yum install vim -y`{{execute T1}}
    
9. Let's look at the helloworld-minishift.yaml file. Your instructor will talk through the pieces of this file. 
    If it doesn't display, please click on below command one more time.
`vim /root/istio-1.2.2/install/kubernetes/helloworld-minishift.yaml`{{execute T2}}

10. Deploy services - We Need This to Set privileged access to the Services. Wait for all pods to start.
`oc apply -f helloworld-minishift.yaml`{{execute T1}}

    `oc get pods`{{execute T1}}
    
    Test Application is running:
    `oc exec -it $(oc get pods -l app=echoserver -o jsonpath='{.items[0].metadata.name}') -c echoserver -- curl hello:8080`{{execute T1}}


11. Now, add privileged access to the pods
`oc adm policy add-scc-to-user privileged -z default -n myproject`{{execute T1}}
`oc adm policy add-scc-to-user privileged -z world -n myproject`{{execute T1}}
`oc adm policy add-scc-to-user privileged -z hello -n myproject`{{execute T1}}

12. OK, Let's delete the pods we just created. You will see why we did this soon
`oc delete -f helloworld-minishift.yaml`{{execute T1}}

13. Create the pods again - This time with sidecars
`istioctl kube-inject -f helloworld-minishift.yaml | oc apply -f -`{{execute T1}}

14. Verify that the pods are running along with the sidecar (indicated by 2/2). Make sure to wait for all pods to be running
`oc get pods`{{execute T1}}

15. Test The Application - Hitting from echoserver
`oc exec -it $(oc get pods -l app=echoserver -o jsonpath='{.items[0].metadata.name}') -c echoserver -- curl hello:8080`{{execute T1}}

16. Test The Application - Hitting from Ingress
`curl 127.0.0.1:31380 -H "Host: hello-tls.example.com"`{{execute T1}}

