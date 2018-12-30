FROM library/alpine:3.8

ARG PACKER_VERSION
ARG PACKER_SHA256

RUN wget -O /tmp/packer.zip \
         https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    echo "${PACKER_SHA256}  /tmp/packer.zip" | sha256sum -c - && \
    unzip /tmp/packer.zip -d /bin/ && \
    rm /tmp/packer.zip && \
    echo "Packer version $(packer --version) successfully installed!"

RUN apk add --update git bash wget openssl
