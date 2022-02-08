### Horizontal Scaling

In this section we'll add a second pod that makes up the SCG service.

![scale up](images/scale1.jpg)

First, let's review the gateway manifest.

```execute-1
kubectl get scg my-gateway -oyaml
```

And how many pods.

```execute-1
kubectl get pods
```

Which is based on the stateful set. Note the number of replicas.

```execute-1
kubectl get statefulsets.apps my-gateway -oyaml
```

Now we can scale the instance up.

```execute-1
kubectl scale scg my-gateway --replicas=2 
```

Check the replicas again, note that it is two now.

```execute-1
kubectl get statefulsets.apps my-gateway -oyaml
```

And a second pod will come up. Of course we could do more than two for higher availability, but let's start with scaling up to two.

Get the pods again.

```execute-1
kubectl get pods
```

Now, scale back down to one.

```execute-1
kubectl scale scg my-gateway --replicas=1
```

Now there will be a single pod again.

```execute-1
kubectl get pods
```

## Vertical Scaling

Not only can we scale out/horizontally by adding more pods, but we can also scale up the resources available to individual pods, ie. "scale vertically".

By default, the pods will have Kubernetes request and limits of:

|        | Request | Limit |
|--------|---------|-------|
| Memory | 256Mi   | 512Mi |
| CPU    | 500m    | 2     |

Let's check those now.

```execute-1
kubectl describe pod my-gateway-0 | grep Limits -A 5
```

We can update the configuration.

```editor:append-lines-to-file
file: ~/demo/my-gateway.yaml
text: |
    spec:
      resources:
        requests:
          memory: "512Mi"
          cpu: "1"
        limits:
          memory: "1Gi"
          cpu: "2"
```

And apply it.

```execute-1
kubectl apply -f ~/demo/my-gateway.yaml
```

>NOTE: The pod will restart!

Now we'll have a new pod with a new request limit.

```execute-1
kubectl describe pod my-gateway-0 | grep Limits -A 5
```

Should be 512Mi for memory now.