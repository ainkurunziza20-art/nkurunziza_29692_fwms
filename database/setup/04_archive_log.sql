-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- Task 4 Explanation: Archive Logging
-- Archive log mode is a Container Database (CDB) setting because it applies to the entire database instance, including all Pluggable Databases (PDBs). It ensures that redo log files are archived before being overwritten, which is essential for recovery. A PDB cannot have its own independent archive log mode; it inherits the mode from the CDB it resides in.
