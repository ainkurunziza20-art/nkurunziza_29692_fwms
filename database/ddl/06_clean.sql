-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- 1. Remove duplicate materials so we only have one of each material name
-- This fixed the Cartesian explosion issue
DELETE FROM materials WHERE material_id NOT IN (
    SELECT MIN(material_id) FROM materials GROUP BY material_name
);
COMMIT;

-- 2. Add a temporary ID to the staging table to allow row-by-row joining
ALTER TABLE staging_orders ADD (temp_id NUMBER);
UPDATE staging_orders SET temp_id = ROWNUM;
COMMIT;
