# ORDS Test Environment

A focused Oracle REST Data Services (ORDS) test environment.

## Quick Start

```bash
# Build and start ORDS
docker-compose up -d

# Check logs
docker-compose logs -f ords

# Access ORDS
open http://localhost:8080/ords/
```

## What's Included

- **ORDS**: Oracle REST Data Services running on Tomcat
- **Web Interface**: Accessible at http://localhost:8080/ords/
- **Minimal Setup**: Ready for configuration

## Access URLs

- **ORDS Home**: http://localhost:8080/ords/
- **APEX (if configured)**: http://localhost:8080/ords/apex/

## Current Status

This is a **minimal ORDS setup** for testing. It includes:

✅ **Working:**
- ORDS web interface
- Tomcat server
- Basic WAR deployment

⚠️ **Note:**
- This is a simplified setup
- For full functionality, download official ORDS from Oracle
- Database connection needs to be configured separately

## Next Steps

1. Test the current setup
2. Download official ORDS WAR from Oracle
3. Configure database connections
4. Set up APEX integration

## Commands

```bash
# Start
docker-compose up -d

# Stop
docker-compose down

# Rebuild
docker-compose build --no-cache

# Logs
docker-compose logs ords
```
