![I want to build a microservice](images/api-gw2.jpg)

Let's make this statement:

>As a developer I want to build a microservice as easily as possible.

To do that I need to:

1. build business logic
2. apply cross cutting concerns

But how to easily deal with the second need? One way is to use the Spring Cloud Gateway, which is a developer friendly environment.

### Why do we need API gateways?

In a microservices architecture, there are multiple types of frontend clients communicating with backend services. These clients could include mobile applications, web applications, or third-party applications. The back end may be composed of many different services exposed over various protocols (SOAP+XML, REST+HTTP, JMS, AMQP, WebSocket, etc.). Clients may collect data from multiple services. In some cases, these services may come from legacy applications, and each application may have its own way of handling security.

Questions arise. How do we minimize the number of client requests to the backend? How do we secure requests for services that may have been originally designed for a different type of client?

### API gateway pattern

![A few of the things and API gateway can do](images/api-gw1.jpg)

In many microservices implementations public services are exposed to clients through an API gateway. Internal microservice endpoints are not exposed to external clients, instead they are kept private. There are a number of reasons for this approach:

* Only a select set of microservices are required by clients
* It is difficult to implement client-specific transformations at the service endpoint
* To avoid multiple client calls in a bandwidth-restricted environment, a gateway can perform data aggregation on behalf of the client
* The number of service instances and their locations may change dynamically

The API gateway offers client-specific APIs (e.g. mobile, tablet, etc.) with protocol translation between a web-friendly client frontend and backend services, such as a message queue or database, with a single point of entry (and control) into the set of exposed services. In other words, the client communicates with one or more API gateways that broker services for the client, rather than communicating directly with the services.

### Value of API gateways

* Clients are isolated from the partitioning of the microservice architecture behind the gateway
* Clients do not have to know the locations of specific services
* If there are client-specific policies to be applied, it is easy to apply them in a single place rather than in multiple places
* The optimal API is provided for each client
* The number of requests/round-trips is reduced
* It simplifies the client implementation by moving the aggregation logic into the API gateway
* Allows centralization of cross-cutting concerns

### Some Issues Developers Tell Us About Traditional API Gateways

* Hard to deliver many micro-gateways, e.g. per business application
* Difficult version control for fast moving code/developers
* Difficult 'self-service' developer model 
* Developers typically don't want to touch API gateway configuration, often due to IT ticket fatigue
* Hard to integrate into the Software Development Life Cycle
* Complex to implement a federated micro-api strategy, as opposed to a centralized model
* Challenging to relegate certain central GW functions to downstream micro-gateways
