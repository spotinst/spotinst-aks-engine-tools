#!/bin/bash
set -e

: ${AZURE_SUBSCRIPTION_ID?"Need to set AZURE_SUBSCRIPTION_ID"}
: ${AKS_DNS_PREFIX?"Need to set AKS_DNS_PREFIX"}
: ${AZURE_LOCATION?"Need to set AZURE_LOCATION"}
: ${SPOTINST_ACCOUNT?"Need to set SPOTINST_ACCOUNT"}
: ${SPOTINST_TOKEN?"Need to set SPOTINST_TOKEN"}
: "${AZURE_RESOURCE_GROUP:=$AKS_DNS_PREFIX}"

aks-engine deploy \
  --auth-method client_secret \
  --client-id $AZURE_CLIENT_ID \
  --client-secret $AZURE_CLIENT_SECRET \
  --subscription-id $AZURE_SUBSCRIPTION_ID \
  --dns-prefix $AKS_DNS_PREFIX \
  --resource-group $AZURE_RESOURCE_GROUP \
  --location $AZURE_LOCATION \
  --api-model /config/models/k8s-azurenet.json \
  -o /output/$AKS_DNS_PREFIX


spotinst-aks-engine import\
  --resource-group $AZURE_RESOURCE_GROUP \
  --output-directory /output/$AKS_DNS_PREFIX \
  --subscription $AZURE_SUBSCRIPTION_ID \
  --set capacity.maximum=3 \
  --set capacity.target=2
