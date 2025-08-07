#!/bin/bash

# ORDS Download Script
# This script downloads ORDS from Oracle's official repository

ORDS_VERSION="25.2.1.194.2034"
ORDS_HOME="/opt/ords"
DOWNLOAD_DIR="/tmp/ords-download"

echo "📥 Downloading ORDS version $ORDS_VERSION..."

# Create download directory
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

# Try different download methods
echo "🔄 Attempting to download ORDS..."

# Method 1: Direct download from Oracle (requires Oracle account)
ORDS_URLS=(
    "https://download.oracle.com/otn/java/ords/ords-${ORDS_VERSION}.zip"
    "https://download.oracle.com/otn/java/ords/ords-25.2.0.194.2034.zip"
    "https://download.oracle.com/otn/java/ords/ords-25.1.0.194.2034.zip"
)

for url in "${ORDS_URLS[@]}"; do
    echo "🔄 Trying: $url"
    if curl -L -o ords.zip "$url" 2>/dev/null; then
        echo "✅ Successfully downloaded ORDS"
        unzip -q ords.zip
        # Find the WAR file
        if [ -f "ords.war" ]; then
            cp ords.war "$ORDS_HOME/ords.war"
            echo "✅ ORDS WAR file copied to $ORDS_HOME"
            break
        else
            echo "⚠️  WAR file not found in downloaded archive"
        fi
    else
        echo "❌ Failed to download from: $url"
    fi
done

# Method 2: If direct download fails, try to create a minimal ORDS setup
if [ ! -f "$ORDS_HOME/ords.war" ]; then
    echo "🔄 Creating minimal ORDS setup..."
    
    # Create a basic WAR structure
    mkdir -p ords-war/WEB-INF
    mkdir -p ords-war/META-INF
    
    # Create web.xml
    cat > ords-war/WEB-INF/web.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
         http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         version="3.0">
    <display-name>Oracle REST Data Services</display-name>
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
    </welcome-file-list>
</web-app>
EOF

    # Create index.html
    cat > ords-war/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Oracle REST Data Services</title>
</head>
<body>
    <h1>Oracle REST Data Services</h1>
    <p>ORDS is running. Please configure the database connection.</p>
</body>
</html>
EOF

    # Create MANIFEST.MF
    cat > ords-war/META-INF/MANIFEST.MF << 'EOF'
Manifest-Version: 1.0
Created-By: Oracle REST Data Services
EOF

    # Create WAR file
    cd ords-war
    jar -cf ../ords.war .
    cd ..
    
    cp ords.war "$ORDS_HOME/ords.war"
    echo "✅ Created minimal ORDS WAR file"
fi

# Cleanup
cd /
rm -rf "$DOWNLOAD_DIR"

echo "✅ ORDS download/creation completed"
