FROM ubuntu:trusty

MAINTAINER connorxxl <christian.flaig@gmail.com>

RUN apt-get -q update && \
    apt-get install -y python-pip build-essential python-dev libffi-dev libssl-dev git && \
    pip install --upgrade cryptography pyopenssl ndg-httpsclient pyasn1 && \
    git clone https://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato && \
    apt-get autoremove && \
    apt-get -y autoremove && \
    apt-get clean

RUN mkdir -p /config && \
    mkdir -p /volumes/complete && \
    mkdir -p /volumes/movies

VOLUME ["/config"]
VOLUME ["/volumes/complete"]
VOLUME ["/volumes/movies"]

EXPOSE 5050

WORKDIR /opt/couchpotato

CMD ["/usr/bin/python", "CouchPotato.py", "--daemon", "--pid_file=/var/run/couchpotato.pid", "--data_dir=/config"]
