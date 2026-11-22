-- Name: Nkurunziza Aimable
-- Student ID: 29692
-- Group: Group I
-- Project: Furniture Workshop Management System (FWMS)

CREATE INDEX idx_orders_customer_id ON orders(customer_id) TABLESPACE fwms_idx;
CREATE INDEX idx_orders_worker_id ON orders(worker_id) TABLESPACE fwms_idx;
CREATE INDEX idx_om_material_id ON order_materials(material_id) TABLESPACE fwms_idx;
CREATE INDEX idx_orders_status_date ON orders(delivery_status, order_date) TABLESPACE fwms_idx;

-- Note: idx_customers_phone was not created because the UNIQUE constraint (uq_customers_phone) on the CUSTOMERS table automatically creates a unique index in Oracle.
