# Spring Cloud Gateway for Kubernetes Learning Center

Sample workshop content using Markdown formatting for pages.

If you already have the Educates operator installed and configured, to
deploy and view this sample workshop, run:

```
kubectl apply -f https://raw.githubusercontent.com/ccollicutt/spring-cloud-gateway-learning-center/master/resources/workshop.yaml
kubectl apply -f https://raw.githubusercontent.com/ccollicutt/spring-cloud-gateway-learning-center/master/resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/spring-cloud-gateway-learning-center
```

The training portal is configured to allow anonymous access. For your own
workshop content you should consider removing anonymous access.


## Notes of Thanks

Please note that this workshop was translated from [Adib Saikali's Spring Cloud WOrkshop](https://github.com/asaikali/spring-one-2021-gateway-for-k8s-workshop).

