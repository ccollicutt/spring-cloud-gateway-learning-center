To provide external access to the Spring Cloud Gateway instance, we need to configure some form of "ingress", either a true Kubernetes Ingress, or something like HTTPProxy provided by [Contour](https://projectcontour.io/) for example.

First, review the ingress manifest.

>NOTE: The manifest has been configured for your specific workshop session.

>NOTE: This ingress is not configured for TLS.

```editor:open-file
file: ~/demo/ingress.yaml
```

Now create the ingress.

```execute-1
kubectl apply -f ~/demo/ingress.yaml
```

Review the created ingress.

```execute-1
kubectl get ingress
```

Curl the ingress, including "/routed/get" for the SCG route.

```execute-1
curl http://$SESSION_NAME-ingress.$INGRESS_DOMAIN/routed/get -H "hello: world"
```

You can also open that URL in the browser.

```dashboard:open-url
url: http://{{ session_namespace }}-ingress.{{ ingress_domain }}/routed/get
```