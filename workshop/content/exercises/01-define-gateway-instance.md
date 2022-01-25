# Define a gateway instance

Inspect the demo/my-gateway.yml file it contains the YAML shown below which defines a spring cloud gateway instance.

```execute-1
cat demo/my-gateway.yaml
```

Execute the below command which will submit a request to the cluster to deploy an instance of spring cloud gateway.

```execute-1
kubectl apply -f demo/my-gateway.yml 
```

You should see a pod of the spring cloud gateway running or being launched in the cluster's default namespace as shown in the output below.

```execute-1
kubectl get all
```

Inspect the file demo/route-config.yml it contains gateway configuration CRD that proxies requests set the gateway to github. Notice that this route configuration is generic.

```execute-1
cat demo/route-config.yml
```

Apply that manifest.

```execute-1
kubectl apply -f demo/route-config.yml
```

Inspect the file demo/mapping.yml notice that it points at the gateway instance we already deployed at the configuration defined in route-config.yml

```execute-1
cat demo/mapping.yml
```

Apply that manifest.

```execute-1
kubectl apply -f demo/mapping.yml
```


