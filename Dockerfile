FROM ghcr.io/hyperk/hk-meta-externals:latest

COPY . /usr/local/hk/hk-DataModel

RUN --mount=type=ssh mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR /usr/local/hk
RUN --mount=type=ssh . /usr/local/hk/hk-pilot/setup.sh &&\
    hkp install -r hk-DataModel
