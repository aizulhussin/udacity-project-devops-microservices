#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockeruser=aizulhussin
dockerimage=predict-app
tag=latest
dockerpath=$dockeruser/$dockerimage
tagimage=$dockerpath:$tag

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u $dockeruser
docker image tag  $dockerimage $tagimage

# Step 3:
# Push image to a docker repository
#docker push
docker push $tagimage
