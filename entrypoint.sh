#!/bin/bash
set -e

ORDS_HOME="/opt/ords"
ORDS_CONFIG="/opt/ords/config"
TOMCAT_HOME="/usr/local/tomcat"

export PATH="$PATH:$ORDS_HOME/bin"

echo "🔧 Iniciando configuración de ORDS con CLI moderna..."

# Verifica si ya está configurado
if [ ! -f "$ORDS_CONFIG/databases/default/pool.xml" ]; then
  echo "📁 Generando configuración inicial..."

  mkdir -p "$ORDS_CONFIG"

  # Establecer configuración con la nueva CLI
  ords config --config "$ORDS_CONFIG" set db.hostname "$DB_HOST"
  ords config --config "$ORDS_CONFIG" set db.port "$DB_PORT"
  ords config --config "$ORDS_CONFIG" set db.servicename "$DB_SERVICE"
  ords config --config "$ORDS_CONFIG" set db.username "APEX_PUBLIC_USER"
  ords config --config "$ORDS_CONFIG" set db.password "$DB_PASSWORD"
  ords config --config "$ORDS_CONFIG" set rest.services.apex.add true
  ords config --config "$ORDS_CONFIG" set feature.sdw true

  echo "🚀 Ejecutando instalación"
  ords install --config "$ORDS_CONFIG" simple
else
  echo "✅ ORDS ya fue configurado anteriormente."
fi

# Copiar el WAR a Tomcat
cp $ORDS_HOME/ords.war $TOMCAT_HOME/webapps/ords.war

echo "🚦 Iniciando Tomcat..."
exec catalina.sh run

