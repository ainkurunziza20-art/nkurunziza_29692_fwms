-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- 1. Insert Customers
INSERT INTO customers (name, phone, district)
SELECT DISTINCT customer_name, customer_phone, customer_district FROM staging_orders;
COMMIT;

-- 2. Insert Workers
INSERT INTO workers (worker_name, role)
SELECT DISTINCT carpenter_name, 'Carpenter' FROM staging_orders WHERE carpenter_name IS NOT NULL;
COMMIT;

-- 3. Insert Materials
INSERT INTO materials (material_name, unit_price)
SELECT DISTINCT material_name, TO_NUMBER(material_price) FROM staging_orders;
COMMIT;

-- 4. Insert Orders (Fixing the spelling mistakes in delivery_status to match the CHECK constraint)
INSERT INTO orders (order_date, customer_id, worker_id, furniture_type, delivery_status)
SELECT SYSDATE, c.customer_id, w.worker_id, s.furniture_type, 
       CASE 
           WHEN s.delivery_status IN ('Ready For Derivery', 'Ready for delivery') THEN 'Ready for Delivery'
           WHEN s.delivery_status IN ('Derivered', 'Delivered') THEN 'Delivered'
           WHEN s.delivery_status IN ('In product', 'In Production') THEN 'In Production'
           ELSE 'Pending'
       END
FROM staging_orders s
JOIN customers c ON s.customer_name = c.name AND s.customer_phone = c.phone
JOIN workers w ON s.carpenter_name = w.worker_name;
COMMIT;

-- 5. Insert Order_Materials (Linking by temp_id to avoid the Cartesian explosion)
INSERT INTO order_materials (order_id, material_id, quantity_used)
SELECT o.order_id, m.material_id, TO_NUMBER(s.material_quantity)
FROM staging_orders s
JOIN orders o ON s.temp_id = o.order_id
JOIN materials m ON s.material_name = m.material_name;
COMMIT;
