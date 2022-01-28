Review the ingress manifest.

>NOTE: The manifest has been configured for your specific workshop session.

```
cat ~/demp/ingress.yaml
```

Create an ingress.

```execute-1
kubectl apply -f ~/demo/ingress.yaml
```

Review the created ingress.

```
kubectl get ingress
```

Curl the ingress.

```execute-1
curl $SESSION_NAME.$INGRESS_DOMAIN/routed/get -H "hello: world"
```

You can also open that URL in the browser.

```dashboard:open-url
url: https://{{ session_namespace }}.{{ ingress_domain }}/routed/get
```