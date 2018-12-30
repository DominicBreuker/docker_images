FROM arm32v7/busybox:1.29

ARG PACKER_VERSION
ARG PACKER_SHA256

RUN wget -O /tmp/packer.zip \
         https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_arm.zip && \
    echo "${PACKER_SHA256}  /tmp/packer.zip" | sha256sum -c - && \
    unzip /tmp/packer.zip -d /bin/ && \
    rm /tmp/packer.zip && \
    packer --version
