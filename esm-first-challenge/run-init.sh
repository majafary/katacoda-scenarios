touch pod.yaml
touch service.yaml

cat > pod.yaml <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: hello-node
  labels:
    tier: frontend
spec:
  containers:
  - name: hello-node
    image: gcr.io/hello-minikube-zero-install/hello-node
    targePort: 8080
EOF

cat > service.yaml <<EOF
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-world-rs
    tier: frontend
  name: hello-service
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 7070
  selector:
    tier: backend
EOF