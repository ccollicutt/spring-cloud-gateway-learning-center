
First, let's deploy two services. We'll pretend "http-echo-one" is the legacy service and http-echo-two is the new microservice we want to send some traffic to.

```execute-1
kubectl create -f ~/demo/http-echo-one.yaml
kubectl create -f ~/demo/http-echo-one.yaml
```

We should now have two services running, also with ingress.

```execute-1
kubectl get svc,ing
```

Next, let's setup the weighted route and mapping.

```execute-1
kubectl create -f ~/demo/weighted-routes-1.yaml
```

If we curl /api, then we should only see "http-echo-one".

```execute-2
while true; do curl $SESSION_NAME-ingress.$INGRESS_DOMAIN/api/; sleep 2; done
```

Let that session run for a bit, then stop it.

```terminal:interrupt
session: 2
```

If we curl /api/catalog, some of the times, one out of ten times or so (over a longer period of time should be exactly 1/10) we will get "http-echo-two", ie. 10% of requests will go to the http-echo-two service.

```execute-2
while true; do curl $SESSION_NAME-ingress.$INGRESS_DOMAIN/api/catalog; sleep 2; done
```

Now stop that curl.

```terminal:interrupt
session: 2
```