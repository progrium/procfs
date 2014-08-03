FROM ubuntu:trusty

RUN apt-get update && apt-get install -y python python-pip
RUN pip install procfs

ADD ./start.sh /start.sh

EXPOSE 8000
ENTRYPOINT ["/start.sh"]