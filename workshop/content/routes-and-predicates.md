### Route Predicates

SCG has a feature called [route predicates](https://cloud.spring.io/spring-cloud-gateway/reference/html/#gateway-request-predicates-factories).

Examples of ways to implement route predicates:

* After (time)
* Before (time)
* Between (time)
* Cookie 
* Header 
* Host 
* Method 
* Path 
* Query 
* RemoteAddr 
* Weight

These route predicates allow us to manage the traffic going to the various APIs managed by the SCG. We'll use weights to manage API resources.