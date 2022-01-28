#!/bin/bash

envsubst < ~/demo/ingress.yaml.envsubst > ~/demo/ingress.yaml
rm ~/demo/ingress.yaml/envsubst