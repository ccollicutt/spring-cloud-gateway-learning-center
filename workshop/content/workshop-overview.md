# Spring Cloud Gateway for Kubernetes

A guided tutorial for experimenting with [VMware Spring Cloud Gateway for Kubernetes (SCGK)](https://docs.vmware.com/en/VMware-Spring-Cloud-Gateway-for-Kubernetes/index.html).

## Spring Cloud Gateway

Spring Cloud Gateway (SCG) is:

>...an API Gateway built on top of the Spring Ecosystem, including: Spring 5, Spring Boot 2 and Project Reactor. Spring Cloud Gateway aims to provide a simple, yet effective way to route to APIs and provide cross cutting concerns to them such as: security, monitoring/metrics, and resiliency. - [Spring Cloud Gateway Reference](https://cloud.spring.io/spring-cloud-gateway/reference/html/)

It's an open source project which you can use to build an API gateway. SCG is used by thousands of development teams to handle their **production** API traffic. Built from the ground up for performance based on its non-blocking I/O design, it can handle load with low latency.

## But...what is Spring Cloud Gateway for Kubernetes?

The open source Spring Cloud Gateway project does not provide a Kubernetes Operator, Kubernetes Custom Resources, etc, instead Spring Cloud Gateway for Kubernetes (SCGK) is a **commercial product** available from [VMware Tanzu](https://docs.vmware.com/en/VMware-Spring-Cloud-Gateway-for-Kubernetes/index.html). SCGK makes SCG Kubernetes native...it becomes part of the Kubernetes API and we can then configure SCG instances and their functionality just like any other Kubernetes object.

>Spring Cloud Gateway for Kubernetes, based on the open source Spring Cloud Gateway project, is the API gateway solution that application developers love. Spring Cloud Gateway for Kubernetes handles cross-cutting concerns on behalf of API development teams, such as: Single Sign-On (SSO), access control, rate limiting, resiliency, security, and more. Accelerate API delivery using modern cloud native patterns, any programming language you choose for API development, and integration with your existing CI/CD pipeline strategy. - [Spring Cloud Gateway for Kubernetes Documentation](https://docs.vmware.com/en/VMware-Spring-Cloud-Gateway-for-Kubernetes/index.html)

With SCGK, the capabilities of Spring Cloud Gateway become part of the Kubernetes API. Using SCGK, which includes a Kubernetes operator, we can extend the Kubernetes API so that it understands how to configure Spring Cloud Gateways, as well as manage the lifecycle of service instances of SCG.

Examples of what the commercial SCGK provides:

* Kubernetes operator with custom resource definitions (CRDs)
* Dynamic API route configuration
* Simple Single Sign-On (SSO) configuration combined with commercial API route filters
* OpenAPI version 3 auto-generated documentation
* High availability configuration by setting instance count for horizontal scalability
* Vertical scaling configuration for memory and vCPU of API gateway instances

