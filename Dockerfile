FROM tomcat:7-jre8

MAINTAINER juliens@microsoft.com

WORKDIR /app

COPY src /app/

RUN /app/gradlew build

RUN cp /app/build/libs/mrp.war /usr/local/tomcat/webapps/

EXPOSE 8080

ENTRYPOINT catalina.sh run
