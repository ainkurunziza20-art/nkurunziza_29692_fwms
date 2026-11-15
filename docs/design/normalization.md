# Phase II — Data Normalization (UNF to 3NF)

This document demonstrates the step-by-step normalization of the raw dataset (`kwizeradecor_orders.csv`) from Unnormalized Form (UNF) to Third Normal Form (3NF). The data represents custom furniture orders at Kwizera Decor.

## 1. Unnormalized Form (UNF)
At this stage, the raw CSV contains all data in one single flat table. It has repeating groups (multiple materials listed for one order) and redundant data.

**Sample UNF Rows:**
| Order_ID | Order_Date | Customer_Name | Customer_Phone | Customer_District | Furniture_Type | Material_Name | Material_Qty | Material_Price | Carpenter_Name | Delivery_Status |
|---|---|---|---|---|---|---|---|---|---|---|
| 1001 | 2026-11-01 | Peter | 791830364 | Gasabo | Sofa | Mahogany Wood | 2 | 50000 | Mechack | Pending |
| 1001 | 2026-11-01 | Peter | 791830364 | Gasabo | Sofa | Foam | 3 | 15000 | Mechack | Pending |
| 1002 | 2026-11-02 | Liza | 784050494 | Bugesera | TV Stand | Pine Wood | 2 | 10000 | Elia | In Production |

*Problem:* If Peter orders a sofa with 3 different materials, his name, phone, and district are repeated 3 times. This causes data redundancy.

## 2. First Normal Form (1NF)
**Rule applied:** Remove repeating groups. Every column must hold a single (atomic) value, and each row must be unique.
**Action:** We ensure that each row represents a single material used in an order. The Primary Key becomes a composite key: `(Order_ID, Material_Name)`.

*Dependency removed:* Repeating groups of materials for a single order.

## 3. Second Normal Form (2NF)
**Rule applied:** Remove partial dependencies. All non-key attributes must depend on the *entire* primary key.
**Action:** 
- `Customer_Name`, `Customer_Phone`, `Customer_District`, `Order_Date`, and `Delivery_Status` only depend on `Order_ID` (not the material). We move them to a new **ORDERS** table.
- `Material_Price` depends on the `Material_Name`, so we move it to a **MATERIALS** table.
- The **ORDER_MATERIALS** table keeps `(Order_ID, Material_Name, Material_Qty)`.

*Dependency removed:* Partial dependencies (attributes depending on only part of the composite key).

## 4. Third Normal Form (3NF)
**Rule applied:** Remove transitive dependencies. Non-key attributes must not depend on other non-key attributes.
**Action:**
- In the **ORDERS** table, `Customer_Name`, `Customer_Phone`, and `Customer_District` depend on the Customer, not the Order itself. We create a separate **CUSTOMERS** table.
- In the **ORDERS** table, `Carpenter_Name` depends on the worker assigned. We create a **WORKERS** table.
- `Furniture_Type` is linked to the order, so it stays in ORDERS.

*Dependency removed:* Transitive dependencies (e.g., Customer details depending on Order_ID).

## 5. Final 3NF Schema
After normalization, we have 5 related tables:

1. **CUSTOMERS** (Customer_ID, Name, Phone, District)
2. **WORKERS** (Worker_ID, Worker_Name, Role)
3. **ORDERS** (Order_ID, Order_Date, Customer_ID, Worker_ID, Furniture_Type, Delivery_Status)
4. **MATERIALS** (Material_ID, Material_Name, Unit_Price)
5. **ORDER_MATERIALS** (Order_ID, Material_ID, Quantity_Used)

**Junction Table:** `ORDER_MATERIALS` resolves the many-to-many relationship between Orders and Materials.
