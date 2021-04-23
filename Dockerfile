FROM alpine:3.7
RUN apk add openjdk8
RUN apk add --no-cache --virtual .service-package wget

RUN wget https://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz -O /tmp/tomcat9.0.45.tar.gz \
    && tar xvfz /tmp/tomcat9.0.45.tar.gz -C /tmp \
    && cp -Rv /tmp/apache-tomcat-9.0.45/* usr/local/tomcat/ \
    && rm -rf /tmp
RUN apk del .service-package
EXPOSE 8080
VOLUME /var/lib/jenkins/workspace/docker pipe/target /usr/local/tomcat/webapps

CMD /usr/local/tomcat/bin/catalina.sh run