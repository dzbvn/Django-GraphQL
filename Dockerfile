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
    && chown -R GraphQLApp /home/GraphQLApp \
    && apt-get update && apt-get install -y python3.10.5 python3.10.5-dev \
    && pip install --user pipenv

USER GraphQLApp
WORKDIR /home/GraphQLApp

    


