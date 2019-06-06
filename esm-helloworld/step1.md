#Create New Project
Execute: `oc new-project myproject`{{execute T1}}
 
#Install istio
Execute: `curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.1.7 sh -`{{execute T1}}
Execute: `cd istio-1.1.7/install/kubernetes/`{{execute T1}}
Execute: `oc apply -f istio-demo.yaml`{{execute T1}}
Execute: `oc get svc -n istio-system`{{execute T1}}
Execute: `oc get pods -n istio-system`{{execute T1}}

Wait for the all the istio pods to come up. This may take a couple minutes minutes. You can use the -w flag to watch the progress of pods.

Execute: `oc label namespace myproject istio-injection=enabled`{{execute T1}}
  
Get the helloworld-minishift.yaml file

Execute: `curl -O https://raw.githubusercontent.com/majafary/archcon/master/helloworld-minishift.yaml`{{execute T1}}
 
#Deploy Services and Inject Sidecar
Execute: `oc apply -f helloworld-minishift.yaml`{{execute T1}}

Wait for pods to be created

Execute: `oc get pods`{{execute T1}}
Execute: `oc adm policy add-scc-to-user privileged -z default -n myproject`{{execute T1}}
Execute: `oc adm policy add-scc-to-user privileged -z world -n myproject`{{execute T1}}
Execute: `oc adm policy add-scc-to-user privileged -z hello -n myproject`{{execute T1}}
Execute: `oc delete -f helloworld-minishift.yaml`{{execute T1}}
  
Set PATH for Istio

Execute: `export ISTIO_HOME="/root/installation/istio-1.1.7"`{{execute T1}}
Execute: `export PATH=$PATH:$ISTIO_HOME/bin`{{execute T1}}
Execute: `istioctl kube-inject -f helloworld-minishift.yaml | oc apply -f -`{{execute T1}}

Verify that the pods are running along with the sidecar (indicated by 2/2). Make sure to wait for all pods to be running

Execute: `oc get pods`{{execute T1}}

#Test Service
Execute: `oc exec -it $(oc get pods -l app=echoserver -o jsonpath='{.items[0].metadata.name}') -c echoserver -- curl hello:8080`{{execute T1}}