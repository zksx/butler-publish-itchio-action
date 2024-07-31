FROM ubuntu:22.04

LABEL "com.github.actions.name"="Butler Push"
LABEL "com.github.actions.description"="Publishes releases to Itch.io using Butler"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="white"

RUN apt-get update

RUN apt-get -y install unzip

RUN apt-get -y install curl

# Install Butler
RUN curl -L -o butler.zip https://broth.itch.zone/butler/linux-amd64/LATEST/archive/default \
    && unzip butler.zip \
    && cp butler /usr/bin \
    && chmod +x /usr/bin/butler

# Run butler push
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
