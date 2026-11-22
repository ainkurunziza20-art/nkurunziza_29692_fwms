# Data Dictionary (Phase IV)

## 1. CUSTOMERS Table
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| customer_id | NUMBER | No | pk_customers (identity) | Unique identifier for each customer. |
| name | VARCHAR2(100) | No | NOT NULL | Full name of the customer. |
| phone | VARCHAR2(20) | No | uq_customers_phone | Contact phone number (must be unique to prevent duplicates). |
| district | VARCHAR2(50) | No | NOT NULL | Location of the customer. |

## 2. WORKERS Table
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| worker_id | NUMBER | No | pk_workers (identity) | Unique identifier for each worker. |
| worker_name | VARCHAR2(100) | No | NOT NULL | Name of the carpenter or installer. |
| role | VARCHAR2(50) | No | ck_workers_role | Job title (CHECK: Carpenter, Installer, Driver). |

## 3. MATERIALS Table
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| material_id | NUMBER | No | pk_materials (identity) | Unique identifier for each material. |
| material_name | VARCHAR2(100) | No | NOT NULL | Name of the material. |
| unit_price | NUMBER(10,2) | No | ck_materials_price | Price per unit (CHECK: > 0). |

## 4. ORDERS Table
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| order_id | NUMBER | No | pk_orders (identity) | Unique identifier for each order. |
| order_date | DATE | No | DEFAULT SYSDATE | The date the order was placed. |
| customer_id | NUMBER | No | fk_orders_customers | Links the order to a customer. |
| worker_id | NUMBER | Yes | fk_orders_workers | Links the order to a carpenter. (Nullable for SET NULL). |
| furniture_type | VARCHAR2(100) | No | NOT NULL | Type of furniture ordered. |
| delivery_status | VARCHAR2(50) | No | ck_orders_status | Current status (CHECK: Pending, In Production, Ready, Delivered). |

## 5. ORDER_MATERIALS Table
| Column | Data type | Null? | Constraint | Why / description |
|---|---|---|---|---|
| order_id | NUMBER | No | pk_order_materials, fk_om_orders | Links to the specific order. |
| material_id | NUMBER | No | pk_order_materials, fk_om_materials | Links to the specific material. |
| quantity_used | NUMBER | No | ck_om_quantity | How many units used (CHECK: > 0). |

## Foreign-Key Decision Table
| Foreign key name | Child table | Parent table | Rule chosen | Why this rule |
|---|---|---|---|---|
| fk_orders_customers | ORDERS | CUSTOMERS | ON DELETE NO ACTION | Sales history must never be lost if a customer is deleted. |
| fk_orders_workers | ORDERS | WORKERS | ON DELETE SET NULL | If a worker leaves, the order remains but needs a new assignment. |
| fk_om_orders | ORDER_MATERIALS | ORDERS | ON DELETE CASCADE | If an order is deleted/cancelled, its material lines must be deleted. |
| fk_om_materials | ORDER_MATERIALS | MATERIALS | ON DELETE NO ACTION | Materials cannot be deleted if they are currently used in an order. |

**Note on ON UPDATE CASCADE:** Oracle does not support ON UPDATE CASCADE. To handle key updates, we use surrogate primary keys (IDENTITY columns) which should never change. If a natural key (like a phone number) changes, we handle it via an UPDATE statement directly on the parent table, and Oracle will enforce referential integrity as long as the FK constraint is enabled.
