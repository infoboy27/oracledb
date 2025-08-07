#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Source Discord alerts
source scripts/discord-alerts.sh

echo "🧹 Oracle APEX Cleanup Script"
echo "============================="
echo ""

# Function to send cleanup notification
notify_cleanup() {
    local action="$1"
    send_discord_message "🧹 Cleanup Action" \
        "Oracle APEX environment cleanup: $action" \
        3447003  # Blue color
}

# Function to stop and remove containers
cleanup_containers() {
    echo "🛑 Stopping and removing containers..."
    
    if docker-compose down; then
        echo "✅ Containers stopped and removed"
        notify_cleanup "Containers stopped and removed"
    else
        echo "❌ Failed to stop containers"
        notify_cleanup "Failed to stop containers"
    fi
}

# Function to remove volumes (optional)
cleanup_volumes() {
    echo "🗑️  Removing volumes..."
    
    read -p "Do you want to remove all volumes? This will delete all data! (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if docker volume rm oracledb_oracle_data oracledb_npm_data oracledb_npm_letsencrypt 2>/dev/null; then
            echo "✅ Volumes removed"
            notify_cleanup "All volumes removed (data deleted)"
        else
            echo "⚠️  Some volumes may not exist or could not be removed"
            notify_cleanup "Volume removal completed with warnings"
        fi
    else
        echo "ℹ️  Volumes preserved"
        notify_cleanup "Volumes preserved"
    fi
}

# Function to remove images
cleanup_images() {
    echo "🗑️  Removing Docker images..."
    
    read -p "Do you want to remove the apex-ords image? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if docker rmi apex-ords 2>/dev/null; then
            echo "✅ apex-ords image removed"
            notify_cleanup "Docker images removed"
        else
            echo "⚠️  apex-ords image not found or could not be removed"
        fi
    else
        echo "ℹ️  Images preserved"
    fi
}

# Function to clean up network
cleanup_network() {
    echo "🌐 Cleaning up networks..."
    
    if docker network rm oracledb_apex_net oracledb_npm_net 2>/dev/null; then
        echo "✅ Networks removed"
    else
        echo "ℹ️  Networks not found or already removed"
    fi
}

# Function to show cleanup summary
show_cleanup_summary() {
    echo ""
    echo "🧹 Cleanup Summary"
    echo "=================="
    echo ""
    
    # Check if containers are still running
    if docker ps | grep -q "oracle-db\|apex-ords\|nginx-proxy-manager"; then
        echo "⚠️  Some containers are still running:"
        docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep -E "(oracle-db|apex-ords|nginx-proxy-manager)"
    else
        echo "✅ All containers stopped"
    fi
    
    # Check volumes
    if docker volume ls | grep -q "oracledb_"; then
        echo "📦 Remaining volumes:"
        docker volume ls | grep "oracledb_"
    else
        echo "✅ All volumes removed"
    fi
    
    # Check networks
    if docker network ls | grep -q "oracledb_"; then
        echo "🌐 Remaining networks:"
        docker network ls | grep "oracledb_"
    else
        echo "✅ All networks removed"
    fi
    
    echo ""
    echo "To restart the environment, run: ./scripts/setup.sh"
}

# Main cleanup function
main() {
    echo "This script will clean up the Oracle APEX environment."
    echo "Choose cleanup options:"
    echo ""
    echo "1. Stop containers only (preserve data)"
    echo "2. Stop containers and remove volumes (delete all data)"
    echo "3. Full cleanup (containers, volumes, images, networks)"
    echo "4. Exit"
    echo ""
    
    read -p "Enter your choice (1-4): " choice
    
    case $choice in
        1)
            echo "🛑 Stopping containers only..."
            cleanup_containers
            ;;
        2)
            echo "🗑️  Stopping containers and removing volumes..."
            cleanup_containers
            cleanup_volumes
            ;;
        3)
            echo "🧹 Full cleanup..."
            cleanup_containers
            cleanup_volumes
            cleanup_images
            cleanup_network
            ;;
        4)
            echo "ℹ️  Exiting without cleanup"
            exit 0
            ;;
        *)
            echo "❌ Invalid choice"
            exit 1
            ;;
    esac
    
    show_cleanup_summary
}

# Run main function
main "$@"
