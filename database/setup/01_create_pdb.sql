-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- 1. Enable Archive Logging (CDB level)
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
ARCHIVE LOG LIST;

-- 2. Create the PDB
CREATE PLUGGABLE DATABASE grpi_29692_nkurunziza_fwms_db 
ADMIN USER nkurunziza_admin IDENTIFIED BY nkurunziza 
FILE_NAME_CONVERT = ('C:\APP\ORADATA\ORCL\PDBSEED\', 'C:\APP\ORADATA\ORCL\grpi_29692_nkurunziza_fwms_db\');

-- 3. Open and Save State
ALTER PLUGGABLE DATABASE grpi_29692_nkurunziza_fwms_db OPEN;
ALTER PLUGGABLE DATABASE grpi_29692_nkurunziza_fwms_db SAVE STATE;
