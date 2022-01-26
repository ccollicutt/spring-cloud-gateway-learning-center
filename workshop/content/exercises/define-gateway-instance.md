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

