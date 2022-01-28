Review the ingress manifest.

>NOTE: The manifest has been configured for your specific workshop session.

```execute-1
cat ~/demo/ingress.yaml
```

Create an ingress.

```execute-1
kubectl apply -f ~/demo/ingress.yaml
```

Review the created ingress.

```execute-1
kubectl get ingress
```

Curl the ingress.

```execute-1
curl http://$SESSION_NAME-ingress.$INGRESS_DOMAIN/routed/get -H "hello: world"
```

You can also open that URL in the browser.

```dashboard:open-url
url: http://{{ session_namespace }}-ingress.{{ ingress_domain }}/routed/get
```