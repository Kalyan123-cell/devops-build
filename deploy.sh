#!/bin/bash

echo "Stopping Existing Container"

docker stop react-app || true

docker rm react-app || true

echo "Starting New Container"

docker run -d --name react-app -p 80:80 devops-build-app:v1

echo "Deployment Completed"


