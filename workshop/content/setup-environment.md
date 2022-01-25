This lab requries that the Spring Cloud Gateway Kubernetes Operator has already been depl;oyed into the Kubernetes cluster.

Run this command to ensure that there are pod running in the cluster that make up the Spring Cloud Gateway Kubernetes Operator.

```execute
k get pods -A -l app=scg-operator
```