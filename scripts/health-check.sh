#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Source Discord alerts
source scripts/discord-alerts.sh

echo "🏥 Oracle APEX Health Check"
echo "==========================="
echo ""

# Function to check if a service is running
check_service() {
    local service_name="$1"
    local check_command="$2"
    local description="$3"
    
    if eval "$check_command" > /dev/null 2>&1; then
        echo "✅ $description"
        return 0
    else
        echo "❌ $description"
        return 1
    fi
}

# Function to check database connectivity
check_database() {
    echo "🔍 Checking Database..."
    
    # Check if container is running
    if ! docker ps | grep -q oracle-db; then
        echo "❌ Oracle Database container is not running"
        return 1
    fi
    
    # Check database connectivity
    if docker exec oracle-db sqlplus -s sys/${DB_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<< "SELECT 1 FROM DUAL;" > /dev/null 2>&1; then
        echo "✅ Database is accessible"
        
        # Check APEX tables
        if docker exec oracle-db sqlplus -s sys/${DB_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<< "SELECT COUNT(*) FROM APEX_APPLICATION_ALL WHERE APPLICATION_ID = 100;" > /dev/null 2>&1; then
            echo "✅ APEX is installed"
            return 0
        else
            echo "❌ APEX tables not found"
            return 1
        fi
    else
        echo "❌ Database is not accessible"
        return 1
    fi
}

# Function to check ORDS
check_ords() {
    echo "🔍 Checking ORDS..."
    
    # Check if container is running
    if ! docker ps | grep -q apex-ords; then
        echo "❌ ORDS container is not running"
        return 1
    fi
    
    # Check ORDS endpoint
    if curl -s http://localhost:8080/ords/ > /dev/null 2>&1; then
        echo "✅ ORDS is accessible"
        return 0
    else
        echo "❌ ORDS is not accessible"
        return 1
    fi
}

# Function to check APEX web interface
check_apex_web() {
    echo "🔍 Checking APEX Web Interface..."
    
    if curl -s http://localhost:8080/ords/apex/ > /dev/null 2>&1; then
        echo "✅ APEX web interface is accessible"
        return 0
    else
        echo "❌ APEX web interface is not accessible"
        return 1
    fi
}

# Function to check container status
check_containers() {
    echo "🔍 Checking Container Status..."
    
    local all_healthy=true
    
    # Check Oracle Database
    if docker ps | grep -q oracle-db; then
        echo "✅ Oracle Database container is running"
    else
        echo "❌ Oracle Database container is not running"
        all_healthy=false
    fi
    
    # Check ORDS
    if docker ps | grep -q apex-ords; then
        echo "✅ ORDS container is running"
    else
        echo "❌ ORDS container is not running"
        all_healthy=false
    fi
    
    # Check Nginx Proxy Manager (optional)
    if docker ps | grep -q nginx-proxy-manager; then
        echo "✅ Nginx Proxy Manager container is running"
    else
        echo "⚠️  Nginx Proxy Manager container is not running (optional)"
    fi
    
    if [ "$all_healthy" = false ]; then
        return 1
    fi
    return 0
}

# Function to check resource usage
check_resources() {
    echo "🔍 Checking Resource Usage..."
    
    # Check memory usage
    local memory_usage=$(docker stats --no-stream --format "table {{.Container}}\t{{.MemUsage}}" | grep -E "(oracle-db|apex-ords)" | awk '{print $2}' | sed 's/MiB//' | awk '{sum+=$1} END {print sum}')
    
    if [ -n "$memory_usage" ] && [ "$memory_usage" -lt 4000 ]; then
        echo "✅ Memory usage is normal: ${memory_usage}MiB"
    else
        echo "⚠️  High memory usage: ${memory_usage}MiB"
    fi
    
    # Check disk usage
    local disk_usage=$(df -h . | awk 'NR==2 {print $5}' | sed 's/%//')
    if [ "$disk_usage" -lt 80 ]; then
        echo "✅ Disk usage is normal: ${disk_usage}%"
    else
        echo "⚠️  High disk usage: ${disk_usage}%"
    fi
}

# Function to get service URLs
get_service_urls() {
    echo ""
    echo "📋 Service URLs:"
    echo "• APEX Application Builder: http://localhost:8080/ords/apex"
    echo "• ORDS REST Services: http://localhost:8080/ords"
    echo "• Database Connection: localhost:1521/FREEPDB1"
    echo "• Nginx Proxy Manager: http://localhost:8181"
    echo ""
}

# Function to get container logs summary
get_logs_summary() {
    echo "📋 Recent Logs Summary:"
    echo "========================"
    
    # Oracle Database logs (last 5 lines)
    echo "🐘 Oracle Database (last 5 lines):"
    docker logs --tail 5 oracle-db 2>/dev/null || echo "No logs available"
    echo ""
    
    # ORDS logs (last 5 lines)
    echo "🌐 ORDS (last 5 lines):"
    docker logs --tail 5 apex-ords 2>/dev/null || echo "No logs available"
    echo ""
}

# Main health check function
main() {
    local overall_status="healthy"
    local details=""
    
    echo "Starting health check at $(date)"
    echo ""
    
    # Check containers
    if check_containers; then
        details+="✅ All containers running\n"
    else
        details+="❌ Some containers not running\n"
        overall_status="unhealthy"
    fi
    
    # Check database
    if check_database; then
        details+="✅ Database healthy\n"
    else
        details+="❌ Database issues\n"
        overall_status="unhealthy"
    fi
    
    # Check ORDS
    if check_ords; then
        details+="✅ ORDS healthy\n"
    else
        details+="❌ ORDS issues\n"
        overall_status="unhealthy"
    fi
    
    # Check APEX web interface
    if check_apex_web; then
        details+="✅ APEX web interface healthy\n"
    else
        details+="❌ APEX web interface issues\n"
        overall_status="unhealthy"
    fi
    
    # Check resources
    check_resources
    
    # Get service URLs
    get_service_urls
    
    # Get logs summary
    get_logs_summary
    
    # Send Discord notification
    notify_health_check "$overall_status" "$details"
    
    # Final status
    if [ "$overall_status" = "healthy" ]; then
        echo "🎉 All services are healthy!"
        exit 0
    else
        echo "⚠️  Some services have issues. Check the logs above for details."
        exit 1
    fi
}

# Run main function
main "$@"
