# Start Using Spring Cloud Gateway for Kubernetes

To start, there will be no springcloudgateways (scg), pods, or stateful sets in the session.

```execute-1
kubectl get scg,statefulsets,pods,pvc
```

The above command should return no resources.

## Create a Gateway Service Instance

Inspect the demo/my-gateway.yaml file it contains the YAML shown below which defines a spring cloud gateway instance.

>NOTE: This will open in the editor.

```editor:open-file
file: ~/demo/my-gateway.yaml
```

Execute the below command which will submit a request to the cluster to deploy an instance of spring cloud gateway.

```execute-1
kubectl apply -f demo/my-gateway.yaml 
```

>NOTE: It can take a few minutes for the gateway to initially come up.

You should see a pod of the spring cloud gateway running or being launched in the cluster's default namespace as shown in the output below.

```execute-1
kubectl get scg,statefulsets,pods,pvc
```

>NOTE: Don't move on until the gateway is labeled true.

You can watch the logs or describe the various objects while you are waiting, example:

```execute-2
echo "sleeping for 20..."; sleep 20; kubectl logs my-gateway-0 --follow
```

Once the gateway's ready status is true, move onto the next section.

Stop following the logs.

```terminal:interrupt
session: 2
```

## Add a Route

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

## Test the Gateway

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