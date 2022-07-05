FROM ubuntu:22.10

# Adding user
RUN groupadd GraphGroup
RUN useradd -ms --quiet /bin/bash GraphQLApp
RUN usermod -a -G GraphGroup GraphQLApp
USER GraphQLApp
WORKDIR /home/GraphQLApp

RUN apt-get update && apt-get install -y python3.10.5 python3.10.5-dev

