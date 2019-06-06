Create New Project
Execute: `oc new-project myproject`{{execute T1}}
 
Install istio

`curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.1.7 sh -`{{execute T1}}

`cd istio-1.1.7/install/kubernetes/`{{execute T1}}

Deploy the Istio Control Plane Components

`oc apply -f istio-demo.yaml`{{execute T1}}

List Istio Control Plane Services

`oc get svc -n istio-system`{{execute T1}}

List Istio Control Plane Pods

`oc get pods -n istio-system`{{execute T1}}

Wait for the all the istio pods to come up. This may take a couple minutes minutes. You can use the -w flag to watch the progress of pods.

`oc label namespace myproject istio-injection=enabled`{{execute T1}}
  
Get the helloworld-minishift.yaml file

`curl -O https://raw.githubusercontent.com/majafary/archcon/master/helloworld-minishift.yaml`{{execute T1}}
 
Deploy services - We Need This to Set privileged access to the Services

`oc apply -f helloworld-minishift.yaml`{{execute T1}}

Wait for pods to be created. You can execute this command again to verify. Alternatively use -w

`oc get pods`{{execute T1}}

Add privileged access to the pods

`oc adm policy add-scc-to-user privileged -z default -n myproject`{{execute T1}}

`oc adm policy add-scc-to-user privileged -z world -n myproject`{{execute T1}}

`oc adm policy add-scc-to-user privileged -z hello -n myproject`{{execute T1}}

Let's delete the pods we just created.

`oc delete -f helloworld-minishift.yaml`{{execute T1}}
  
Set PATH for Istio

`export ISTIO_HOME="/root/istio-1.1.7"`{{execute T1}}

`export PATH=$PATH:$ISTIO_HOME/bin`{{execute T1}}

Create the pods again - This time with sidecars

`istioctl kube-inject -f helloworld-minishift.yaml | oc apply -f -`{{execute T1}}

Verify that the pods are running along with the sidecar (indicated by 2/2). Make sure to wait for all pods to be running

`oc get pods`{{execute T1}}

Test The Application

`oc exec -it $(oc get pods -l app=echoserver -o jsonpath='{.items[0].metadata.name}') -c echoserver -- curl hello:8080`{{execute T1}}