#!/bin/bash

set -x

make docker-build
kind load docker-image controller:latest
make install
make deploy
kubectl rollout restart -n mdview-controller-system deployment mdview-controller-controller-manager
kubectl get pod -n mdview-controller-system
