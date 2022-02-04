> In a distributed environment, calls to remote resources and services can fail due to transient faults, such as slow network connections, timeouts, or the resources being overcommitted or temporarily unavailable...In these situations it might be pointless for an application to continually retry an operation that is unlikely to succeed, and instead the application should quickly accept that the operation has failed and handle this failure accordingly. - [Microsoft Documentation](https://docs.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker)

### Configure a Circuit Breaker

First, review the file. This configuration will send requests to "SCG/breaker" to http://httpbin.org. We will use "/delay/3" to tell httpbin.org to delay the reply, and due to the delay the SCG will "break the circuit" (because httpbin.org hasn't replied quickly enough).

>NOTE: This file has both the route config and mapping manifests in it.

```editor:open-file
file: ~/demo/circuit-breaker.yaml
```

Now apply the circuit breaker.

```execute-1
kubectl apply -f ~/demo/circuit-breaker.yaml
```

And curl the endpoint.

```execute-1
curl -s $SESSION_NAME-ingress.$INGRESS_DOMAIN/breaker/delay/3 | jq
```

We should see something like the below returned. The request timed out.

```
{
SNIP!
  "path": "/breaker/delay/3",
  "status": 504,
  "error": "Gateway Timeout",
SNIP!
}
```

Now let's configure a fallback URI.

```editor:open-file
file: ~/demo/circuit-breaker-fallback.yaml
```

Note the **new** configuration will now forward any circuit breaks to "/fallback/get" and that route is configured to add a header and strip "/fallback" from the URI, which leads the request to end up at httpbin.org/get.

Apply that configuration.

```execute-1
kubectl apply -f ~/demo/circuit-breaker-fallback.yaml
```

Curl the endpoint.

```execute-1
curl -s $SESSION_NAME-ingress.$INGRESS_DOMAIN/breaker/delay/3 | jq
```

We should now see a result like the below. 

>Note the "X-Forwarded-Prefix" which is "/fallback" as well as the "X-Exception" header added. This request has gone to httpbin.org/get.

```
{
  "args": {},
  "headers": {
SNIP!
    "X-Exception": "java.util.concurrent.TimeoutException",
    "X-Forwarded-Prefix": "/fallback"
  },
SNIP!
  "url": "https://httpbin.org/get"
}
```

Here we've shown we can configure a circuit breaker, and as well include a fallback URL.