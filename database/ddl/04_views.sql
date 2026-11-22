-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

-- 1. Reporting View
CREATE OR REPLACE VIEW vw_order_details AS
SELECT o.order_id, c.name AS customer_name, w.worker_name AS carpenter, o.furniture_type, o.delivery_status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN workers w ON o.worker_id = w.worker_id;

-- 2. Summary View
CREATE OR REPLACE VIEW vw_carpenter_workload AS
SELECT w.worker_name, COUNT(o.order_id) AS total_orders
FROM workers w
JOIN orders o ON w.worker_id = o.worker_id
GROUP BY w.worker_name;

-- 3. Protected View
CREATE OR REPLACE VIEW vw_showroom_inventory AS
SELECT material_id, material_name, unit_price
FROM materials
WHERE unit_price > 0
WITH READ ONLY;
