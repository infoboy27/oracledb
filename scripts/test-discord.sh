#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Source Discord alerts
source scripts/discord-alerts.sh

echo "🧪 Testing Discord Webhook"
echo "=========================="
echo ""

# Test basic message
echo "📤 Sending test message..."
send_discord_message "🧪 Discord Test" \
    "This is a test message from the Oracle APEX setup script.\n\n"\
    "**Timestamp:** $(date)\n"\
    "**Environment:** Local Development\n"\
    "**Status:** Testing" \
    3447003  # Blue color

echo "✅ Test message sent!"
echo ""
echo "Check your Discord channel for the test message."
echo "If you don't see it, verify your webhook URL in the .env file."
