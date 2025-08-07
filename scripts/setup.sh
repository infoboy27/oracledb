#!/bin/bash
set -e

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Source Discord alerts
source scripts/discord-alerts.sh

echo "🚀 Starting Oracle APEX Local Development Setup"
notify_startup

# Function to check if Docker is running
check_docker() {
    if ! docker info > /dev/null 2>&1; then
        echo "❌ Docker is not running. Please start Docker and try again."
        notify_error "Docker is not running"
        exit 1
    fi
    echo "✅ Docker is running"
}

# Function to check if ports are available
check_ports() {
    local ports=("1521" "8080" "8081" "8181" "4443")
    local available=true
    
    for port in "${ports[@]}"; do
        if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
            echo "⚠️  Port $port is already in use"
            available=false
        fi
    done
    
    if [ "$available" = false ]; then
        echo "❌ Some required ports are already in use. Please free them up and try again."
        notify_error "Required ports are already in use"
        exit 1
    fi
    echo "✅ All required ports are available"
}

# Function to create .env file if it doesn't exist
create_env_file() {
    if [ ! -f .env ]; then
        echo "📝 Creating .env file from template..."
        cp env.example .env
        echo "✅ .env file created. Please review and modify if needed."
    else
        echo "✅ .env file already exists"
    fi
}

# Function to build and start services
start_services() {
    echo "🐳 Building and starting Docker services..."
    
    # Build the ORDS image
    echo "🔨 Building ORDS image..."
    docker build -t apex-ords .
    
    # Start all services
    echo "🚀 Starting services..."
    docker-compose up -d
    
    echo "⏳ Waiting for services to start..."
    sleep 30
}

# Function to wait for database to be ready
wait_for_database() {
    echo "⏳ Waiting for Oracle Database to be ready..."
    
    local max_attempts=60
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if docker exec oracle-db sqlplus -s sys/${DB_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<< "SELECT 1 FROM DUAL;" > /dev/null 2>&1; then
            echo "✅ Database is ready!"
            notify_database_ready
            return 0
        fi
        
        echo "⏳ Attempt $attempt/$max_attempts - Database not ready yet..."
        sleep 10
        ((attempt++))
    done
    
    echo "❌ Database failed to start within expected time"
    notify_error "Database failed to start within expected time"
    return 1
}

# Function to check APEX installation
check_apex_installation() {
    echo "🔍 Checking APEX installation..."
    
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if docker exec oracle-db sqlplus -s sys/${DB_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<< "SELECT COUNT(*) FROM APEX_APPLICATION_ALL WHERE APPLICATION_ID = 100;" > /dev/null 2>&1; then
            echo "✅ APEX is installed and ready!"
            notify_apex_installed
            return 0
        fi
        
        echo "⏳ Attempt $attempt/$max_attempts - APEX not ready yet..."
        sleep 10
        ((attempt++))
    done
    
    echo "❌ APEX installation check failed"
    notify_error "APEX installation check failed"
    return 1
}

# Function to check ORDS
check_ords() {
    echo "🔍 Checking ORDS..."
    
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -s http://localhost:8080/ords/ > /dev/null 2>&1; then
            echo "✅ ORDS is ready!"
            notify_ords_ready
            return 0
        fi
        
        echo "⏳ Attempt $attempt/$max_attempts - ORDS not ready yet..."
        sleep 10
        ((attempt++))
    done
    
    echo "❌ ORDS check failed"
    notify_error "ORDS check failed"
    return 1
}

# Function to run health checks
run_health_checks() {
    echo "🏥 Running health checks..."
    
    local health_status="healthy"
    local details=""
    
    # Check database
    if docker exec oracle-db sqlplus -s sys/${DB_PASSWORD}@localhost:1521/FREEPDB1 as sysdba <<< "SELECT 1 FROM DUAL;" > /dev/null 2>&1; then
        details+="✅ Database: Running\n"
    else
        details+="❌ Database: Not responding\n"
        health_status="unhealthy"
    fi
    
    # Check APEX
    if curl -s http://localhost:8080/ords/apex/ > /dev/null 2>&1; then
        details+="✅ APEX: Accessible\n"
    else
        details+="❌ APEX: Not accessible\n"
        health_status="unhealthy"
    fi
    
    # Check ORDS
    if curl -s http://localhost:8080/ords/ > /dev/null 2>&1; then
        details+="✅ ORDS: Running\n"
    else
        details+="❌ ORDS: Not responding\n"
        health_status="unhealthy"
    fi
    
    notify_health_check "$health_status" "$details"
    
    if [ "$health_status" = "healthy" ]; then
        echo "✅ All health checks passed!"
        return 0
    else
        echo "⚠️  Some health checks failed"
        return 1
    fi
}

# Function to display final information
show_final_info() {
    echo ""
    echo "🎉 Oracle APEX Local Development Setup Complete!"
    echo "================================================"
    echo ""
    echo "📋 Access Information:"
    echo "• APEX Application Builder: http://localhost:8080/ords/apex"
    echo "• ORDS REST Services: http://localhost:8080/ords"
    echo "• Database Connection: localhost:1521/FREEPDB1"
    echo ""
    echo "🔐 Default Credentials:"
    echo "• Username: admin@example.com"
    echo "• Password: Admin123!"
    echo ""
    echo "🐳 Docker Commands:"
    echo "• View logs: docker-compose logs -f"
    echo "• Stop services: docker-compose down"
    echo "• Restart services: docker-compose restart"
    echo ""
    echo "📊 Health Check:"
    echo "• Run: ./scripts/health-check.sh"
    echo ""
    
    notify_setup_complete
}

# Main execution
main() {
    echo "🔧 Oracle APEX Local Development Setup"
    echo "======================================"
    echo ""
    
    # Pre-flight checks
    check_docker
    check_ports
    create_env_file
    
    # Start services
    start_services
    
    # Wait for services to be ready
    wait_for_database
    check_apex_installation
    check_ords
    
    # Final health check
    run_health_checks
    
    # Show final information
    show_final_info
}

# Run main function
main "$@"
