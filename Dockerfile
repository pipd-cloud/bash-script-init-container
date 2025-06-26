FROM alpine:latest

# Set Dockerfile metadata
LABEL maintainer="tionichm@duck.com"
LABEL license="MIT"
LABEL description="Alpine Linux with useful tools for init containers"

# Set the default packages to install
ARG PACKAGES="curl wget jq aws-cli"
ENV PACKAGES=${PACKAGES}

# Update the package index and install necessary packages
RUN apk update && apk add --no-cache bash ${PACKAGES}

# Set the default shell
SHELL [ "bash" ]

# Set the entrypoint to a shell script
ENTRYPOINT ["/bin/bash", "-c"]

# Set the default command to print a user-friendly message
CMD ["printf \"Welcome to the Bash Init Container!\n\
    The following tools are available: ${PACKAGES} \n\
    You can run commands interactively or use it in your Kubernetes/ECS init containers.\n\
    This container is designed to receive a bash script to execute as a string.\nExample Usage:\n\
    docker run --rm -it init 'echo Hello World'\n\""]
