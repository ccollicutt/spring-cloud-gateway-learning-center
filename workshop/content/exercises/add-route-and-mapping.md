## Create a Route

Inspect the file demo/route-config.yaml it contains gateway configuration CRD that proxies requests set the gateway to github. Notice that this route configuration is generic.

```editor:open-file
file: ~/demo/route-config.yaml
```

Apply that manifest.

```execute-1
kubectl apply -f demo/route-config.yaml
```

Check the status.

```execute-1
kubectl get springcloudgatewayrouteconfigs
```

Now let's map that route to a gateway.

## Map a Route to a Gateway

Inspect the file demo/mapping.yaml notice that it points at the gateway instance we already deployed at the configuration defined in route-config.yaml

```editor:open-file
file: ~/demo/mapping.yaml
```

Apply that manifest.

```execute-1
kubectl apply -f demo/mapping.yaml
```

At this point we should also have some services available.

```execute-1
kubectl get svc
```

Check the mapping.

```execute-1
kubectl get springcloudgatewaymappings
```

## Test the Route, Mapping and Gateway

We can port forward to the my-gateway service to access the gateway locally.

```execute-2
kubectl port-forward service/my-gateway 8080:80
```

Now we can start to connect to the gateway instance which will route to the external service configured in the route.

First, let's try something that will fail.

```execute-1
curl localhost:8080/get
```

That should fail with a 404, which makes sense because the gateway doesn't have a route for "/get".

Next, let's use "/routed" which according to the rule should send the request to the convenient external service httpbin.org.

Below I'm setting the headers "hello:world" and httpbin will return those same headers in the response.

```execute-1
curl localhost:8080/routed/get -H "hello: world"
```

Note how the response should include the added headers.

Example output (some output removed for brevity):

```bash
$ curl localhost:8080/routed/get -H "hello: world"
SNIP
    "Forwarded": "proto=http;host=\"localhost:8080\";for=\"127.0.0.1:45948\"", 
    "Hello": "world", 
    "Host": "httpbin.org", 
SNIP
}
```

This section of the workshop is now completed.