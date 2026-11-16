-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- Connect as your admin user (nkurunziza_admin)
CREATE TABLESPACE fwms_data DATAFILE 'fwms_data01.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE 1G;
CREATE TABLESPACE fwms_idx DATAFILE 'fwms_idx01.dbf' SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;
CREATE TEMPORARY TABLESPACE fwms_temp TEMPFILE 'fwms_temp01.dbf' SIZE 50M AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- Set defaults for the admin user
ALTER USER nkurunziza_admin DEFAULT TABLESPACE fwms_data TEMPORARY TABLESPACE fwms_temp QUOTA UNLIMITED ON fwms_data QUOTA UNLIMITED ON fwms_idx;
