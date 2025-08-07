#!/bin/bash

# Discord Webhook URL
DISCORD_WEBHOOK_URL="${DISCORD_WEBHOOK_URL:-https://discord.com/api/webhooks/1403028132830646323/t_ghmxmYMm6l9ldaLGsrtQEhcuqy-77BHL-ojLpv07wUnuYoOcujk1Fd4ZgJHWSWVExn}"

# Colors for Discord embeds
COLOR_SUCCESS=3066993  # Green
COLOR_ERROR=15158332   # Red
COLOR_INFO=3447003     # Blue
COLOR_WARNING=16776960 # Yellow

send_discord_message() {
    local title="$1"
    local description="$2"
    local color="$3"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
    
    # Escape newlines and quotes in description
    local escaped_description=$(echo "$description" | sed 's/\\n/\\\\n/g' | sed 's/"/\\"/g')
    
    local payload=$(cat <<EOF
{
    "embeds": [
        {
            "title": "$title",
            "description": "$escaped_description",
            "color": $color,
            "timestamp": "$timestamp",
            "footer": {
                "text": "Oracle APEX Local Development"
            }
        }
    ]
}
EOF
)
    
    curl -H "Content-Type: application/json" \
         -X POST \
         -d "$payload" \
         "$DISCORD_WEBHOOK_URL" 2>/dev/null
}

notify_startup() {
    send_discord_message "🚀 Oracle APEX Setup Started" \
        "Starting Oracle Database and APEX installation process..." \
        $COLOR_INFO
}

notify_database_ready() {
    send_discord_message "✅ Database Ready" \
        "Oracle Database is running and ready for connections on port 1521" \
        $COLOR_SUCCESS
}

notify_apex_installed() {
    send_discord_message "📦 APEX Installed" \
        "Oracle APEX has been successfully installed and configured" \
        $COLOR_SUCCESS
}

notify_ords_ready() {
    send_discord_message "🌐 ORDS Ready" \
        "Oracle REST Data Services is running and accessible at http://localhost:8080/ords" \
        $COLOR_SUCCESS
}

notify_setup_complete() {
    send_discord_message "🎉 Setup Complete!" \
        "Oracle APEX environment is fully configured and ready for development!\n\n"\
        "**Access URLs:**\n"\
        "• APEX: http://localhost:8080/ords/apex\n"\
        "• ORDS: http://localhost:8080/ords\n"\
        "• Database: localhost:1521/FREEPDB1\n\n"\
        "**Credentials:**\n"\
        "• Username: admin@example.com\n"\
        "• Password: Admin123!" \
        $COLOR_SUCCESS
}

notify_error() {
    local error_msg="$1"
    send_discord_message "❌ Setup Error" \
        "An error occurred during setup: $error_msg" \
        $COLOR_ERROR
}

notify_health_check() {
    local status="$1"
    local details="$2"
    
    if [ "$status" = "healthy" ]; then
        send_discord_message "💚 Health Check Passed" \
            "All services are running properly:\n$details" \
            $COLOR_SUCCESS
    else
        send_discord_message "⚠️ Health Check Warning" \
            "Some services may have issues:\n$details" \
            $COLOR_WARNING
    fi
}

# Export functions for use in other scripts
export -f send_discord_message
export -f notify_startup
export -f notify_database_ready
export -f notify_apex_installed
export -f notify_ords_ready
export -f notify_setup_complete
export -f notify_error
export -f notify_health_check
