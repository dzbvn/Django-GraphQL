FROM ubuntu:22.10

# Adding user
RUN useradd -ms /bin/bash GraphQLApp
USER GraphQLApp
WORKDIR /home/GraphQLApp

