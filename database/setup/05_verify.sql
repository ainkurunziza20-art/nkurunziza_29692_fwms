-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- Verification queries for Phase 3
SELECT name, open_mode FROM v$pdbs;
SELECT username, default_tablespace, temporary_tablespace FROM dba_users WHERE username = 'NKURUNZIZA_ADMIN';
SELECT tablespace_name, file_name, bytes, autoextensible, maxbytes FROM dba_data_files WHERE tablespace_name LIKE 'FWMS%';
SELECT log_mode FROM v$database;
