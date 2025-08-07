FROM tomcat:9.0-jdk17-temurin

<<<<<<< HEAD
ENV TOMCAT_HOME=/usr/local/tomcat

# Install required packages
RUN apt-get update && \
    apt-get install -y wget curl unzip zip netcat-traditional && \
    rm -rf /var/lib/apt/lists/*

# Create ORDS directory
RUN mkdir -p /opt/ords

# Copy ORDS WAR file and entrypoint script
COPY ords.war /opt/ords/
COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh
=======
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
>>>>>>> c2a9c4c88f06c1849de2898077980abb28fdc402

EXPOSE 8080

ENTRYPOINT ["/opt/entrypoint.sh"]
<<<<<<< HEAD
=======

>>>>>>> c2a9c4c88f06c1849de2898077980abb28fdc402
