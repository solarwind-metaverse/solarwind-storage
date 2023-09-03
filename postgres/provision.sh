#!/bin/bash

kubectl apply -f kubernetes/pvc.yml
kubectl apply -f kubernetes/deployment.yml
kubectl apply -f kubernetes/service.yml
kubectl apply -f kubernetes/load-balancer.yml