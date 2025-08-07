#!/bin/bash

echo "📥 Downloading Official ORDS from Oracle..."

# ORDS version and URLs
ORDS_VERSION="25.2.1.194.2034"
DOWNLOAD_DIR="/tmp/ords-download"

# Create download directory
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

echo "🔄 Attempting to download ORDS version $ORDS_VERSION..."

# Try different download methods
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
            echo "✅ Found ORDS WAR file"
            break
        else
            echo "⚠️  WAR file not found in downloaded archive"
        fi
    else
        echo "❌ Failed to download from: $url"
    fi
done

# Check if we got the WAR file
if [ -f "ords.war" ]; then
    echo "✅ ORDS WAR file downloaded successfully"
    echo "📁 File size: $(ls -lh ords.war | awk '{print $5}')"
else
    echo "❌ Failed to download ORDS WAR file"
    echo "💡 You may need to:"
    echo "   1. Download ORDS manually from Oracle's website"
    echo "   2. Place the ords.war file in this directory"
    echo "   3. Rebuild the container"
fi

cd /
rm -rf "$DOWNLOAD_DIR"
