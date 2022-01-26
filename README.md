# WIP: Spring Cloud Gateway for Kubernetes Learning Center

A VMware Tanzu Learning Center workshop to experiment with Spring Cloud Gateway for Kubernetes.

## Deploy the Workshop

```
kubectl apply -f https://raw.githubusercontent.com/ccollicutt/spring-cloud-gateway-learning-center/main/resources/workshop.yaml
kubectl apply -f https://raw.githubusercontent.com/ccollicutt/spring-cloud-gateway-learning-center/main/resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/spring-cloud-gateway-learning-center
```

## Lab Requirements

This lab requires that the Spring Cloud Gateway for Kubernetes Operator has already been deployed into the Kubernetes cluster that the workshop is using.

## Notes of Thanks

Please note that this workshop was translated from [Adib Saikali's Spring Cloud Workshop](https://github.com/asaikali/spring-one-2021-gateway-for-k8s-workshop).

