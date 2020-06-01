FROM hyperledger/fabric-ccenv:latest

MAINTAINER gonzalobellino@ 
ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY

#ENV NODE_TLS_REJECT_UNAUTHORIZED=0
#ENV npm_config_strict_ssl=false
ENV npm_config_registry="http://registry.npmjs.org/"

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ENV NO_PROXY=$NO_PROXY

#RUN npm config set strict-ssl false 

RUN npm config set registry "http://registry.npmjs.org/"
