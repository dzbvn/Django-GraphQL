FROM ubuntu:22.10 AS builder

ENV TZ ${TZ_LOCATION}

RUN apt-get update \
    && apt-get install -y tzdata \
    && apt-get install -y --no-install-recommends \
        build-essential \
		dpkg-dev \
		gnupg dirmngr \
		libbluetooth-dev \
		libbz2-dev \
		libc6-dev \
		libexpat1-dev \
		libffi-dev \
		libgdbm-dev \
		liblzma-dev \
		libncursesw5-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		tk-dev \
		uuid-dev \
		wget \
		xz-utils \
		zlib1g-dev \
    && wget --no-check-certificate https://www.python.org/ftp/python/3.10.5/Python-3.10.5.tar.xz \
    && tar -xf Python-3.10.5.tar.xz \
    && cd Python-3.10.5 \
    && ./configure --enable-optimizations \
    && make altinstall

FROM builder

RUN addgroup --system GraphQLApp \
    && adduser --system \
    --quiet \
    --ingroup GraphQLApp \
    --shell /bin/bash GraphQLApp \
    --gecos GraphQLAppUser \
    && chown -R GraphQLApp /home/GraphQLApp 

WORKDIR /home/GraphQLApp

USER GraphQLApp

RUN pip install --user pipenv

CMD ["sh"]


    

