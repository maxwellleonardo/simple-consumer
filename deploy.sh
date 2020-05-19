#!/bin/bash

deploy-simple-consumer(){
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 576962245852.dkr.ecr.us-east-1.amazonaws.com
    docker build -t simple-consumer .
    docker tag simple-consumer:latest 576962245852.dkr.ecr.us-east-1.amazonaws.com/simple-consumer:latest
    docker push 576962245852.dkr.ecr.us-east-1.amazonaws.com/simple-consumer:latest
    
    kubectl apply -f deployment.yml
}

deploy-simple-consumer