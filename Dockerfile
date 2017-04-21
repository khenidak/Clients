FROM tomcat:7-jre8

MAINTAINER juliens@microsoft.com

WORKDIR /app

COPY src /app/
COPY ./run.sh /app


EXPOSE 8090

ENTRYPOINT /app/run.sh
