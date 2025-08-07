FROM tomcat:9.0-jdk17-temurin

ENV ORDS_HOME=/opt/ords \
    ORDS_CONFIG_DIR=/opt/ords/config \
    APEX_HOME=/opt/apex \
    TOMCAT_HOME=/usr/local/tomcat

# Copiar ORDS descomprimido (no solo .war)
COPY ords /opt/ords
COPY apex /opt/apex
COPY entrypoint.sh /opt/entrypoint.sh

RUN apt-get update && \
    apt-get install -y unzip curl libaio-dev && \
    chmod +x /opt/entrypoint.sh && \
    mkdir -p $TOMCAT_HOME/webapps/i && \
    cp -r $APEX_HOME/images/* $TOMCAT_HOME/webapps/i/

EXPOSE 8080

ENTRYPOINT ["/opt/entrypoint.sh"]

