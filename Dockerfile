ARG AZURE_CLI_VERSION=2.0.59

FROM microsoft/azure-cli:$AZURE_CLI_VERSION

ARG AKS_ENGINE_VERSION=0.31.3
ARG SPOTINST_AKS_ENGINE_VERSION=0.1.3
ARG KUBECTL_VERSION=1.12.6


ADD https://github.com/Azure/aks-engine/releases/download/v${AKS_ENGINE_VERSION}/aks-engine-v${AKS_ENGINE_VERSION}-linux-amd64.tar.gz /tmp
ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD https://s3.amazonaws.com/spotinst-public/integrations/kubernetes/aks-engine/v${SPOTINST_AKS_ENGINE_VERSION}/spotinst-aks-engine-linux-amd64 /usr/local/bin/spotinst-aks-engine

RUN cd /tmp \
      && tar xf aks-engine-v${AKS_ENGINE_VERSION}-linux-amd64.tar.gz \
      && cp aks-engine-v${AKS_ENGINE_VERSION}-linux-amd64/aks-engine /usr/local/bin \
      && rm -rf aks-engine-v${AKS_ENGINE_VERSION}-linux-amd64* \
      && mkdir /app \
      && chmod +x /usr/local/bin/spotinst-aks-engine

ADD scripts /scripts

VOLUME /output
VOLUME /config

ADD models /config/models

ENTRYPOINT ["/scripts/entry"]
CMD bash

