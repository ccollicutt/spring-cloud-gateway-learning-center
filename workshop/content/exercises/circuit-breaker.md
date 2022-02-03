Here we will configure a circuit breaker.

First, review the file. This configuration will send requests to the SCG/breaker to http://httpbin.org. We will use "/delay/3" to tell httpbin.org to delay the reply, and the SCG will "break the circuit" because httpbin.org hasn't replied soon enough.

>NOTE: This has both the route config and mapping manifests in it.

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
  "timestamp": "2022-02-03T21:31:48.348+00:00",
  "path": "/breaker/delay/3",
  "status": 504,
  "error": "Gateway Timeout",
  "message": "Did not observe any item or terminal signal within 1000ms in 'circuitBreaker' (and no fallback has been configured)",
  "requestId": "bf0c3917-2",
  "exception": "java.util.concurrent.TimeoutException"
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