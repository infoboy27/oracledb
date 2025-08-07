# ORDS Test Environment

A focused Oracle REST Data Services (ORDS) test environment with proper configuration.

## Quick Start

```bash
# Build and start ORDS with database
docker-compose up -d

# Check logs
docker-compose logs -f ords

# Access ORDS
open http://localhost:8080/ords/
```

## What's Included

- **Oracle Database**: gvenzl/oracle-free:23.3
- **ORDS**: Oracle REST Data Services with proper configuration
- **Database Connection**: Automatically configured
- **Standalone Mode**: ORDS runs in standalone mode (not Tomcat)

## ORDS Configuration Process

When you add the real ORDS WAR file, the system will:

1. **Create admin user** with SYSDBA privileges:
   ```sql
   CREATE USER admin IDENTIFIED BY admin250420;
   GRANT SYSDBA TO admin;
   ```

2. **Create orcl service**:
   ```sql
   DBMS_SERVICE.CREATE_SERVICE('orcl', 'orcl');
   DBMS_SERVICE.START_SERVICE('orcl');
   ```

3. **Create params.properties** with database settings:
   ```
   db.hostname=oracle-db
   db.port=1521
   db.servicename=orcl
   db.username=admin
   db.password=admin250420
   user.tablespace=USERS
   temp.tablespace=TEMP
   ```

4. **Install ORDS** with parameters:
   ```bash
   java -jar ords.war install --parameterFile params.properties --silent
   ```

5. **Start ORDS** in standalone mode:
   ```bash
   java -jar ords.war standalone
   ```

## Access URLs

- **ORDS Home**: http://localhost:8080/ords/
- **APEX (when configured)**: http://localhost:8080/ords/apex/
- **Database**: localhost:1521/orcl

## Current Status

This setup includes:

✅ **Working:**
- Oracle Database container
- ORDS configuration process
- Database connection parameters
- Standalone ORDS mode

⚠️ **Note:**
- Currently using minimal setup
- For full functionality, download official ORDS from Oracle
- Will automatically configure with database when real ORDS WAR is added

## To Get Real ORDS UI

1. **Download ORDS** from Oracle's website:
   - https://www.oracle.com/database/technologies/appdev/rest-data-services-downloads.html
   - You'll need an Oracle account (free to create)

2. **Extract the ords.war file** from the downloaded ZIP

3. **Place ords.war in this directory** (`/Users/jonatanmaria/Desktop/oracledb/ords-test/ords.war`)

4. **Rebuild the container:**
   ```bash
   docker-compose build --no-cache
   docker-compose up -d
   ```

5. **ORDS will automatically:**
   - Create admin user with SYSDBA privileges
   - Create and start orcl service
   - Configure database connection
   - Install ORDS with proper settings
   - Start in standalone mode
   - Provide the real ORDS UI

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

# Database logs
docker-compose logs oracle-db
```

## Database Credentials

- **Host**: oracle-db (container) or localhost (external)
- **Port**: 1521
- **Service**: orcl
- **Username**: admin
- **Password**: admin250420
- **Privileges**: SYSDBA
