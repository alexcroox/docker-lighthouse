FROM debian:jessie

USER root

# Download Deps
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-transport-https git ca-certificates curl gnupg

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

RUN curl -sSL https://deb.nodesource.com/setup_12.x | bash -

# Install Deps
RUN apt-get install -y google-chrome-stable nodejs --no-install-recommends

RUN npm i -g lighthouse