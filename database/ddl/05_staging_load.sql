-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- 1. Create the staging table
CREATE TABLE staging_orders (
    order_id VARCHAR2(50),
    order_date VARCHAR2(50),
    customer_name VARCHAR2(100),
    customer_phone VARCHAR2(50),
    customer_district VARCHAR2(100),
    furniture_type VARCHAR2(100),
    material_name VARCHAR2(100),
    material_quantity VARCHAR2(50),
    material_price VARCHAR2(50),
    carpenter_name VARCHAR2(100),
    delivery_status VARCHAR2(100),
    total_amount_paid VARCHAR2(50)
);

-- 2. Load Data
-- The data was generated from the real Kwizera Decor business records in Excel.
-- 501 rows were copied and pasted into SQL*Plus using INSERT statements.
-- Example of the format used:
-- INSERT INTO staging_orders VALUES ('1001', '2026-11-01', 'Kwizera Enock', '0788123456', 'Gasabo', 'Sofa', 'Mahogany Wood', '1', '50000', 'Mechack', 'Pending', '90000');
