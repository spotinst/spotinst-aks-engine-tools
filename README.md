# spotinst-aks-engine-tools

A Docker Image that contains binaries and scripts that help deploy
aks-engine Spotinst Elastigroups

Get the Image on [Docker Hub][dockerhub-url]
Get the code on [GitHub][github-url]

## Scripts

### create-simple

Create a Kubernetes cluster with Elastigroup workers with a single
command

```
docker run -it --rm \
  -e SPOTINST_ACCOUNT=act-XXXXXXXX \
  -e SPOTINST_TOKEN=XXXXXXXX \
  -e AZURE_SUBSCRIPTION_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX \
  -e AKS_DNS_PREFIX=spot-aks-engine-prefix \
  -e AZURE_LOCATION=eastus \
  -e AZURE_CLIENT_SECRET="XXXXXXXX" \
  -e AZURE_CLIENT_ID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX \
  -v $PWD/output:/output \
  spotinst/spotinst-aks-engine-tools create-simple
```

## Continue Reading

Official Spotinst documentation for [aks-engine][spotinstapi-url]

[dockerhub-url]: https://hub.docker.com/r/spotinst/spotinst-aks-engine-tools
[github-url]: https://github.com/spotinst/spotinst-aks-engine-tools
[spotinstapi-url]: https://api.spotinst.com/container-management/kubernetes/aks-engine/
