#!/bin/bash

NAMESPACE="$1"

#check for params
if [ "x$NAMESPACE" == "x" ]; then
    echo "Env var NAMESPACE is empty. Provide a valid target NAMESPACE"
    exit 2;
fi

## update the helm repos first
helm repo update

## deploy apigateway/devportal with the helm charts
helm upgrade -i --namespace $NAMESPACE -f ./descriptors/helm/devportal.yaml devportal saggov-helm-charts/webmethods-devportal
helm upgrade -i --namespace $NAMESPACE -f ./descriptors/helm/apigateway.yaml apigateway saggov-helm-charts/webmethods-apigateway

## from local helm charts (ie. for development)
# helm upgrade -i --namespace $NAMESPACE -f ./descriptors/helm/devportal.yaml devportal ${SAGGOV_HELMCHART_HOME}/webmethods-devportal
# helm upgrade -i --namespace $NAMESPACE -f ./descriptors/helm/apigateway.yaml apigateway ${SAGGOV_HELMCHART_HOME}/webmethods-apigateway