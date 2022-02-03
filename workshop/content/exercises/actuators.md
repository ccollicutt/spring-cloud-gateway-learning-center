Spring Cloud Gateway configures actuators for itself:

* /actuator/info - display version and other Gateway instance information
* /actuator/health - displays Gateway instance health indicator as status value UP or DOWN
* /actuator/gateway/routes - retrieve list of all API routes currently available on Gateway instance
* /actuator/gateway/globalfilters - retrieve list of global filters enabled on Gateway instance
* /actuator/gateway/routefilters - retrieve list of route filters available on Gateway instance

First, forward to port 8090 on the headless service component.

```execute-2
kubectl port-forward service/my-gateway-headless 8090:8090
```

Now we can curl the actuator endpoints.

```execute-1
curl localhost:8090/actuator/health
```

Example output:

```
{"status":"UP","groups":["liveness","readiness"]}
```

Info:

```execute-1
curl localhost:8090/actuator/info | jq
```

Routes:

```execute-1
curl localhost:8090/actuator/gateway/routes | jq
```

Global filters enabled and available in the gateway:

```execute-1
curl localhost:8090/actuator/gateway/globalfilters | jq
```

Route filters enabled and available in the gateway:

```execute-1
curl localhost:8090/actuator/gateway/routefilters | jq
```

Stop the port fowarding:

```terminal:interrupt
session: 2
```

