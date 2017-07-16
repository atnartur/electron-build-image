FROM suchja/wine:latest

USER root

RUN chown root:root /home/xclient

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN npm i -q -g gulp

WORKDIR /build