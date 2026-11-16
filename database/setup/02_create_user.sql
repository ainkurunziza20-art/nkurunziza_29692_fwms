-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- Connect to the new PDB
ALTER SESSION SET CONTAINER = grpi_29692_nkurunziza_fwms_db;

-- Grant DBA role to the admin user
GRANT DBA TO nkurunziza_admin;

-- Fix Listener Registration (Windows specific)
ALTER SYSTEM SET LOCAL_LISTENER='(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521))' SCOPE=BOTH;
ALTER SYSTEM REGISTER;
