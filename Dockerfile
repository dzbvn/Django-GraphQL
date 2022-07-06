FROM ubuntu:22.10

# Adding user
RUN addgroup --system GraphQLApp \
    && adduser --system \
    --quiet \
    --ingroup GraphQLApp \
    --shell /bin/bash GraphQLApp \
    --gecos GraphQLAppUser \
    && apt update \
    && pip install --upgrade pip \
    && chown -R GraphQLApp /home/GraphQLApp

USER GraphQLApp
WORKDIR /home/GraphQLApp

RUN apt-get update && apt-get install -y python3.10.5 python3.10.5-dev &&\
    sudo apt-get -y install python3-pip &&\
    pip3 install --user pipenv


