#!/bin/bash

echo "Building Docker Image"

docker build -t devops-build-app:v1 .

echo "Build Completed Successfullly"


