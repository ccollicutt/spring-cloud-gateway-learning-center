#!/bin/bash

envsubst < ~/demo/ingress.yaml.envsubst > ~/demo/ingress.yaml
rm ~/demo/ingress.yaml.envsubst

envsubst < ~/demo/legacy-api.yaml.envsubst > ~/demo/legacy-api.yaml
rm ~/demo/legacy-api.yaml.envsubst

envsubst < ~/demo/microservice-api.yaml.envsubst > ~/demo/microservice-api.yaml
rm ~/demo/microservice-api.yaml.envsubst

envsubst < ~/demo/strangler-fig.yaml.envsubst > ~/demo/strangler-fig.yaml
rm ~/demo/strangler-fig.yaml.envsubst