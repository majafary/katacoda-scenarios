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


cat > package.json <<EOF

{
  "name": "root",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "colors": "^1.3.3"
  }
}

EOF

npm install

cat > index.js <<EOF
if(process.env.pass){
    console.log("########     #########     ##       #    ###########    ########    ########   #####    #########".green);
    console.log("#            #       #     # #      #    #              #      #    #      #     #      #".green);
    console.log("#            #       #     #   #    #    #     #####    ######      ########     #      #########".green);
    console.log("#            #       #     #    #   #    #     ##  #    #     #     #      #     #              #".green);
    console.log("########     #########     #      # #    ###########    #      #    #      #     #      #########".green);
}else{
    console.log("#################     ############ #         ############     ############        #             # ".red);
    console.log("#                     #            #         #          #     #          #        #             # ".red);
    console.log("#                     #            #         #          #     #          #        #             # ".red);
    console.log("#                     #            #         #          #     #          #        #             # ".red);
    console.log("#                     #            #         #          #     #          #        #             # ".red);
    console.log("#                     #            #         #          #     #          #        #             # ".red);
    console.log("#                     #            #         #          #     #          #        #             # ".red);
    console.log("#################     #            #         #########        #          #        ############### ".red);
    console.log("                #     #            #         #        #       #########                  #        ".red);
    console.log("                #     #            #         #          #     #        #                 #        ".red);
    console.log("                #     #            #         #          #     #          #               #        ".red);
    console.log("                #     #            #         #          #     #          #               #        ".red);
    console.log("                #     #            #         #          #     #          #               #        ".red);
    console.log("                #     #            #         #          #     #          #               #        ".red);
    console.log("                #     #            #         #          #     #          #               #        ".red);
    console.log("                #     #            #         #          #     #          #               #        ".red);
    console.log("#################     ##############         #          #     #          #               #        ".red);

}



EOF