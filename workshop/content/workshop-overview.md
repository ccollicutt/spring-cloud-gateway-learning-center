# Spring Cloud Gateway for Kubernetes

A guided tutorial for experimenting with [VMware Spring Cloud Gateway for Kubernetes (SCGK)](https://docs.vmware.com/en/VMware-Spring-Cloud-Gateway-for-Kubernetes/index.html).

## What is Spring Cloud Gateway for Kubernetes?

>Spring Cloud Gateway for Kubernetes, based on the open source Spring Cloud Gateway project, is the API gateway solution that application developers love. Spring Cloud Gateway for Kubernetes handles cross-cutting concerns on behalf of API development teams, such as: Single Sign-On (SSO), access control, rate limiting, resiliency, security, and more. Accelerate API delivery using modern cloud native patterns, any programming language you choose for API development, and integration with your existing CI/CD pipeline strategy. - [Spring Cloud Gateway for Kubernetes Documentation](https://docs.vmware.com/en/VMware-Spring-Cloud-Gateway-for-Kubernetes/index.html)

With SCGK, the capabilities of Spring Cloud Gateway become part of the Kubernetes API. Using SCGK, which includes a Kubernetes operator, we can extend the Kubernetes API so that it understands how to configure Spring Cloud Gateways, as well as manage the lifecycle of service instances of SCG.

Examples of what the commercial SCGK provides:

* Kubernetes operator with custom resource definitions (CRDs)
* Dynamic API route configuration
* Simple Single Sign-On (SSO) configuration combined with commercial API route filters
* OpenAPI version 3 auto-generated documentation
* High availability configuration by setting instance count for horizontal scalability
* Vertical scaling configuration for memory and vCPU of API gateway instances

