For the purposes of this section, let's assume Acme Co. has a monolithic application that exposes an API and they want to incrementally break apart this monolithic app following the [strangler fig](https://martinfowler.com/bliki/StranglerFigApplication.html) pattern. 

In order to decouple the API consumers from service providers and provide flexibility for service implementation changes, they deploy Spring Cloud Gateway for Kubernetes in front of their API, then update DNS entries for the API to point to the Spring Cloud Gateway instance. Let's call this legacy API "http-echo-one". 

They then develop a new microservice for their catalog business domain and deploy it. Let's call this service "http-echo-two".

Once this new microservice is implemented, all API traffic is directed toward the legacy monolithic application with the exception of the endpoints now implemented by the new microservice, ie. "/api/catalog". These endpoints are described as routes within the SpringCloudGatewayRouteConfig, where weighted traffic distribution is configured to send 10% of the traffic to the new microservice (http-echo-two) in order to compare performance and efficiency.

### Implement the Strangler Fig Pattern

First, let's deploy two services. As mentioned, we'll think of "http-echo-one" as the legacy service and "http-echo-two" is the new microservice we want to send some of the application traffic to.

```execute-1
kubectl create -f ~/demo/http-echo-one.yaml
kubectl create -f ~/demo/http-echo-two.yaml
```

We should now have two services running, also with ingress.

```execute-1
kubectl get svc,ing
```

Next, let's setup the weighted route and mapping.

```execute-1
kubectl create -f ~/demo/weighted-routes-1.yaml
```

If we curl /api, then we should only see "http-echo-one".

```execute-2
while true; do curl $SESSION_NAME-ingress.$INGRESS_DOMAIN/api/; sleep 2; done
```

Let that session run for a bit, then stop it.

```terminal:interrupt
session: 2
```

If we curl /api/catalog, some of the times, one out of ten times or so (over a longer period of time should be exactly 1/10) we will get "http-echo-two", ie. 10% of requests will go to the http-echo-two service.

About 10% of the traffic will now go to "http-echo-two", the new microservice.

```execute-2
while true; do curl $SESSION_NAME-ingress.$INGRESS_DOMAIN/api/catalog; sleep 2; done
```

Now stop that curl.

```terminal:interrupt
session: 2
```