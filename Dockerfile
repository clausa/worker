FROM ubuntu:13.10
MAINTAINER "Claus Albøge" <csa@csa-net.dk>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends curl git htop unzip vim wget python-pip python-dev

# Add Multiverse:
#vi /etc/apt/sources.list
#RUN apt-get install --no-install-suggests aws-cloudformation-cli elbcli ec2-api-tools ec2-ami-tools iamcli rdscli
# RUN pip install awscli

RUN apt-get update && apt-get install -y --no-install-recommends libmysqlclient-dev libmemcached-dev

ADD requirements.pip /tmp/requirements.pip
RUN pip install virtualenv
RUN virtualenv /srv/siteenv
RUN apt-get install -y --no-install-recommends build-essential
RUN cd /srv/siteenv/ && /bin/bash -c 'source bin/activate && pip install -r /tmp/requirements.pip'
