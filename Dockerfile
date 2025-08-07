FROM tomcat:9.0-jdk17-temurin

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

EXPOSE 8080

ENTRYPOINT ["/opt/entrypoint.sh"]
