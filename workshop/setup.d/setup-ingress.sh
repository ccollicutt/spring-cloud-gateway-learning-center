#!/bin/bash

envsubst < ~/demo/ingress.yaml.envsubst > ~/demo/ingress.yaml
rm ~/demo/ingress.yaml.envsubst

envsubst < ~/demo/http-echo-one.yaml.envsubst > ~/demo/http-echo-one.yaml
rm ~/demo/http-echo-one.yaml.envsubst

envsubst < ~/demo/http-echo-two.yaml.envsubst > ~/demo/http-echo-two.yaml
rm ~/demo/http-echo-two.yaml.envsubst

envsubst < ~/demo/weighted-routes-1.yaml.envsubst > ~/demo/weighted-routes-1.yaml
rm ~/demo/weighted-routes-1.yaml.envsubst