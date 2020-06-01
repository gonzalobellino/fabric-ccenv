# fabric-ccenv
Custom Dockerfile of Hyperledger Fabric cc image base with PROXY settings

## The problem

Hyperledger Fabric v1.x dont support translate environment variables from the peer into the chaincode container. It's a problem in some environments with proxies connection

We can rebuild the base image provided by HLF with a custom one like this [dockerfile](dockerfile)

~~~ 

docker build --build-arg HTTP_PROXY=http://10.30.28.25:80 --build-arg HTTPS_PROXY=http://10.30.28.25:80 -t oea/ccenv .

~~~

also we need to overwrite a couple of ENV settings before start the peer again

for instance in a docker-compose.yaml
~~~

- CORE_CHAINCODE_BUILDER=hyperledger/fabric-ccenv:latest

~~~

Additionally for node chaincode

~~~
- CORE_CHAINCODE_NODE_RUNTIME=hyperledger/fabric-ccenv:latest
~~~


Additionally for java chaincode

~~~
- CORE_CHAINCODE_JAVA_RUNTIME=oea/javaenv:latest
~~~
