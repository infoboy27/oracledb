#!/bin/bash
set -e

echo "Esperando que Oracle se inicie..."
sleep 60

echo "Instalando APEX en FREEPDB1..."

sqlplus sys/${ORACLE_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<EOF
whenever sqlerror exit failure rollback;
alter session set container=FREEPDB1;
@/opt/apex/apexins.sql SYSAUX SYSAUX TEMP /i/
EOF

echo "Creando usuario ADMIN APEX..."
sqlplus sys/${ORACLE_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<EOF
@/opt/apex/apxchpwd.sql
EOF

echo "Instalando ORDS en FREEPDB1..."
sqlplus sys/${ORACLE_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<EOF
begin
  ords.enable_schema(
    p_enabled => TRUE,
    p_schema => 'APEX_PUBLIC_USER',
    p_url_mapping_type => 'BASE_PATH',
    p_url_mapping_pattern => 'ords',
    p_auto_rest_auth => FALSE
  );
end;
/
commit;
EOF

echo "✔️ Instalación completa"
