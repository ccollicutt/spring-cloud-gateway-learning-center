# Define a gateway instance

To start, there will be no springcloudgateways (scg), pods, or stateful sets in the session.

```execute-1
kubectl get scg,statefulsets,pods,pvc
```

The above command should return nothing.

Inspect the demo/my-gateway.yaml file it contains the YAML shown below which defines a spring cloud gateway instance.

```execute-1
cat demo/my-gateway.yaml
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

Inspect the file demo/route-config.yaml it contains gateway configuration CRD that proxies requests set the gateway to github. Notice that this route configuration is generic.

```execute-1
cat demo/route-config.yaml
```

Apply that manifest.

```execute-1
kubectl apply -f demo/route-config.yaml
```

Inspect the file demo/mapping.yaml notice that it points at the gateway instance we already deployed at the configuration defined in route-config.yaml

```execute-1
cat demo/mapping.yaml
```

Apply that manifest.

```execute-1
kubectl apply -f demo/mapping.yaml
```

Now curl the localhost