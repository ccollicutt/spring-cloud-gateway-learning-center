TBD

In the [OSS version of SCG](https://docs.spring.io/spring-cloud-gateway/docs/current/reference/html/#cors-configuration), CORS is a "global" configuration.

```
spring:
  cloud:
    gateway:
      globalcors:
        cors-configurations:
          '[/**]':
            allowedOrigins: "https://docs.spring.io"
            allowedMethods:
            - GET
```



