ARG GOLANG_VERSION=1.14.2
FROM golang:${GOLANG_VERSION}-buster

ARG PYTHON_VERSION=3.8.2

RUN apt update -y && \
  apt install -y build-essential \
	libbz2-dev \
	libdb5.3-dev \
	libexpat1-dev \
	libffi-dev \
	libgdbm-dev \
	liblzma-dev \
	libncurses5-dev \
	libncursesw5-dev \
	libreadline-dev \
	libsqlite3-dev \
	libssl-dev \
	uuid-dev \
	zlib1g-dev

WORKDIR /tmp
RUN curl -LO https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
  tar xzf Python-${PYTHON_VERSION}.tgz && \
  rm Python-${PYTHON_VERSION}.tgz

WORKDIR /tmp/Python-${PYTHON_VERSION}
RUN ./configure && \
  make install && \
  rm -r /tmp/Python-${PYTHON_VERSION}

WORKDIR /app
