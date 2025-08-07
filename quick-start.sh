#!/bin/bash

echo "🚀 Oracle APEX Quick Start"
echo "=========================="
echo ""

# Check if we're in the right directory
if [ ! -f "docker-compose.yaml" ]; then
    echo "❌ Please run this script from the project root directory"
    exit 1
fi

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file from template..."
    cp env.example .env
    echo "✅ .env file created. Please review and modify if needed."
    echo ""
    echo "⚠️  IMPORTANT: Please edit the .env file with your preferences before continuing."
    echo "   - Set your database password"
    echo "   - Update Discord webhook URL (optional)"
    echo "   - Modify admin credentials"
    echo ""
    read -p "Press Enter to continue after editing .env file..."
fi

# Make scripts executable
echo "🔧 Making scripts executable..."
chmod +x scripts/*.sh

# Test Discord webhook
echo "🧪 Testing Discord webhook..."
./scripts/debug-discord.sh

# Run setup
echo "🚀 Starting Oracle APEX setup..."
./scripts/setup.sh

echo ""
echo "🎉 Quick start completed!"
echo ""
echo "📋 Next steps:"
echo "1. Wait for setup to complete (10-15 minutes)"
echo "2. Access APEX at: http://localhost:8080/ords/apex"
echo "3. Run health check: ./scripts/health-check.sh"
echo "4. Stop services: ./scripts/cleanup.sh"
echo ""
