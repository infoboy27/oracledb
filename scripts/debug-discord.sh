#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

echo "🧪 Debugging Discord Webhook"
echo "============================"
echo ""

# Test with simple JSON first
echo "📤 Testing simple message..."
curl -H "Content-Type: application/json" \
     -X POST \
     -d '{"content":"Test message from Oracle APEX setup"}' \
     "$DISCORD_WEBHOOK_URL"

echo ""
echo "📤 Testing embed message..."

# Test with embed
curl -H "Content-Type: application/json" \
     -X POST \
     -d '{
       "embeds": [
         {
           "title": "Test Message",
           "description": "This is a test message",
           "color": 3447003
         }
       ]
     }' \
     "$DISCORD_WEBHOOK_URL"

echo ""
echo "✅ Debug tests completed!"
