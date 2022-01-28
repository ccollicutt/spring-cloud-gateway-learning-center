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

Now, back down to one.

```execute-1
kubectl scale scg my-gateway --replicas=1
```

Now there will be a single pod again.

```execute-1
kubectl get pods
```