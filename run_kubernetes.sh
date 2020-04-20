#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=aizulhussin/predict-app:latest
app=predict-app
hostport=8080
port=8080

# Step 2
# Run the Docker Hub container with kubernetes
# start the pod running nginx
echo "Run docker.."
docker run -d --restart=always -e DOMAIN=cluster --name $app -p $hostport:$port $dockerpath

kubectl run --image=$dockerpath $app --port=8080 --env="DOMAIN=cluster"


# Step 3:
# List kubernetes pods
echo "kubectl get pods..."
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $app $hostport:$port
