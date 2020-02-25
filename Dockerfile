FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install gcc libc-dev tcl8.5-dev tk8.5-dev libdb-dev unixodbc-dev openjdk-11-jdk -y

RUN mkdir /app

WORKDIR /app

COPY sp-4.4.1-x86_64-linux-glibc2.17.tar.gz /app

RUN cat sp-4.4.1-x86_64-linux-glibc2.17.tar.gz | gzip -cd | tar xf -

RUN cd sp-4.4.1-x86_64-linux-glibc2.17 && ./InstallSICStus --batch --without-java --nolicense

RUN rm /app/sp-4.4.1-x86_64-linux-glibc2.17.tar.gz 

ENTRYPOINT [ "/usr/local/sicstus4.4.1/bin/sicstus" ]
