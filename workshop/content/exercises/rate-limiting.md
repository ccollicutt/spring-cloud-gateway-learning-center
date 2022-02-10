TBD

Spring Cloud Gateway can also do rate limiting.

First, make sure the two microservices from previous sections are running.

```execute-1
kubectl create -f ~/demo/legacy-api.yaml
kubectl create -f ~/demo/microservice-api.yaml
```

Now add the rate-limit route and mapping.