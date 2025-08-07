#!/bin/bash
set -e

echo "🚀 Starting ORDS Setup..."

ORDS_HOME="/opt/ords"
TOMCAT_HOME="/usr/local/tomcat"

# Function to check if database is ready
check_database_ready() {
    echo "🔍 Checking if database is ready..."
    max_attempts=30
    attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        echo "📊 Attempt $attempt/$max_attempts - Checking database connection..."
        
        # Try to connect to the database using netcat
        if nc -z oracle-db 1521; then
            echo "✅ Database port is accessible!"
            return 0
        else
            echo "⏳ Database not ready yet, waiting 10 seconds..."
            sleep 10
            attempt=$((attempt + 1))
        fi
    done
    
    echo "❌ Database not ready after $max_attempts attempts"
    return 1
}

# Check if real ORDS WAR file is available
if [ -f "./ords.war" ]; then
    echo "✅ Found real ORDS WAR file"
    cp ./ords.war "$ORDS_HOME/ords.war"
    echo "✅ Real ORDS WAR file copied to ORDS home"
    
    # Create ORDS configuration directory
    mkdir -p "$ORDS_HOME/config"
    cd "$ORDS_HOME"
    
    # Check if ORDS is already configured
    if [ ! -f "$ORDS_HOME/config/ords.conf" ]; then
        echo "🔧 Configuring ORDS..."
        
        # Wait for database to be ready
        if ! check_database_ready; then
            echo "❌ Database not ready, exiting..."
            exit 1
        fi
        
        # Wait additional time for database to be fully open
        echo "⏳ Waiting for database to be fully open..."
        sleep 60
        
        # First, install ORDS using SYS user to create metadata schema
        echo "🔧 Installing ORDS using SYS user..."
        
        # Create params.properties file for ORDS configuration using SYS user
        cat > "$ORDS_HOME/params.properties" << 'EOF'
db.hostname=oracle-db
db.port=1521
db.servicename=FREE
db.username=SYS
db.password=admin250420
user.tablespace=USERS
temp.tablespace=TEMP
EOF

        echo "📋 ORDS parameters configured for SYS user:"
        cat "$ORDS_HOME/params.properties"
        
        # Install ORDS with SYS user using new CLI
        echo "🔧 Installing ORDS with SYS user..."
        java -jar ords.war install --parameterFile params.properties --silent
        
        if [ $? -eq 0 ]; then
            echo "✅ ORDS installed successfully with SYS user"
            
            # Now create the admin user and orcl service
            echo "🔧 Creating admin user with SYSDBA privileges and orcl service..."
            
            # Create a SQL script to set up admin user and orcl service
            cat > "$ORDS_HOME/setup_admin_orcl.sql" << 'EOF'
-- Create admin user with SYSDBA privileges
CREATE USER admin IDENTIFIED BY admin250420;

-- Grant SYSDBA privileges
GRANT SYSDBA TO admin;

-- Grant necessary privileges
GRANT CONNECT, RESOURCE TO admin;
GRANT CREATE SESSION TO admin;
GRANT CREATE TABLE TO admin;
GRANT CREATE VIEW TO admin;
GRANT CREATE PROCEDURE TO admin;
GRANT CREATE SEQUENCE TO admin;
GRANT CREATE TRIGGER TO admin;
GRANT UNLIMITED TABLESPACE TO admin;

-- Grant ORDS metadata access to admin
GRANT SELECT ON ORDS_METADATA.ORDS_SCHEMAS TO admin;
GRANT SELECT ON ORDS_METADATA.ORDS_SCHEMAS_VIEW TO admin;

-- Create orcl service
BEGIN
  DBMS_SERVICE.CREATE_SERVICE(
    service_name => 'orcl',
    network_name => 'orcl'
  );
END;
/

-- Start the orcl service
BEGIN
  DBMS_SERVICE.START_SERVICE('orcl');
END;
/

COMMIT;
EOF

            echo "✅ Admin user and orcl service setup script created"
            
            # Wait a bit for the service to be fully registered
            echo "⏳ Waiting for orcl service to be fully registered..."
            sleep 30
            
            # Update params.properties for admin user
            cat > "$ORDS_HOME/params.properties" << 'EOF'
db.hostname=oracle-db
db.port=1521
db.servicename=orcl
db.username=admin
db.password=admin250420
user.tablespace=USERS
temp.tablespace=TEMP
EOF

            echo "📋 ORDS parameters updated for admin user:"
            cat "$ORDS_HOME/params.properties"
            
        else
            echo "⚠️  ORDS installation failed with SYS user, trying interactive mode..."
            echo "1" | java -jar ords.war install
        fi
    else
        echo "✅ ORDS already configured"
    fi
    
    # Start ORDS in standalone mode using new CLI
    echo "🚀 Starting ORDS in standalone mode..."
    cd "$ORDS_HOME"
    java -jar ords.war serve
    
elif [ -f "$ORDS_HOME/ords.war" ]; then
    echo "✅ ORDS WAR file already exists"
    cd "$ORDS_HOME"
    java -jar ords.war serve
else
    echo "📥 No real ORDS found, starting Tomcat without ORDS..."
    echo "⚠️  Please add ords.war file to get the original ORDS interface"
    
    # Don't create any custom WAR, just start Tomcat
    echo "🚦 Starting Tomcat..."
    exec catalina.sh run
fi
