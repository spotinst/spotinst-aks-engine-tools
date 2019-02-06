FROM microsoft/azure-cli

ADD https://github.com/Azure/aks-engine/releases/download/v0.28.1/aks-engine-v0.28.1-linux-amd64.tar.gz /tmp
ADD https://storage.googleapis.com/kubernetes-release/release/v1.12.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD https://s3.amazonaws.com/spotinst-public/integrations/kubernetes/aks-engine/v0.1.0/spotinst-aks-engine-linux-amd64 /usr/local/bin/spotinst-aks-engine

RUN cd /tmp \
      && tar xf aks-engine-v0.28.1-linux-amd64.tar.gz \
      && cp aks-engine-v0.28.1-linux-amd64/aks-engine /usr/local/bin \
      && rm -rf aks-engine-v0.28.1-linux-amd64* \
      && mkdir /app \
      && chmod +x /usr/local/bin/spotinst-aks-engine

ADD scripts /scripts


VOLUME /output
VOLUME /config

ADD models /config/models


ENTRYPOINT ["/scripts/entry"]
CMD bash

