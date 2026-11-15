# Data Dictionary

This document describes the logical design of the Furniture Workshop Management System (FWMS) database in Third Normal Form (3NF). 

## 1. CUSTOMERS Table
Stores information about the clients who order furniture.

| Column Name | Description | Required? | Unique? |
| :--- | :--- | :--- | :--- |
| Customer_ID | Unique identifier for each customer (Primary Key). | Yes | Yes |
| Name | Full name of the customer. | Yes | No |
| Phone | Contact phone number. | Yes | No |
| District | Location of the customer in Rwanda (e.g., Gasabo, Kicukiro). | Yes | No |

## 2. WORKERS Table
Stores information about the carpenters and installers.

| Column Name | Description | Required? | Unique? |
| :--- | :--- | :--- | :--- |
| Worker_ID | Unique identifier for each worker (Primary Key). | Yes | Yes |
| Worker_Name | Name of the carpenter or installer. | Yes | No |
| Role | Job title (e.g., Carpenter, Installer, Delivery Driver). | Yes | No |

## 3. MATERIALS Table
Stores information about raw materials used in the workshop.

| Column Name | Description | Required? | Unique? |
| :--- | :--- | :--- | :--- |
| Material_ID | Unique identifier for each material (Primary Key). | Yes | Yes |
| Material_Name | Name of the material (e.g., Mahogany Wood, Foam, Varnish). | Yes | Yes |
| Unit_Price | Price per unit of the material. | Yes | No |

## 4. ORDERS Table
Stores the main details of each furniture order.

| Column Name | Description | Required? | Unique? |
| :--- | :--- | :--- | :--- |
| Order_ID | Unique identifier for each order (Primary Key). | Yes | Yes |
| Order_Date | The date the order was placed. | Yes | No |
| Customer_ID | Links the order to a specific customer (Foreign Key). | Yes | No |
| Worker_ID | Links the order to the assigned carpenter (Foreign Key). | No | No |
| Furniture_Type | Type of furniture ordered (e.g., Sofa, Bed, Wardrobe). | Yes | No |
| Delivery_Status | Current status of the order (e.g., Pending, In Production, Delivered). | Yes | No |

## 5. ORDER_MATERIALS Table (Junction Table)
Links materials to orders and tracks how much of each material is used. This resolves the many-to-many relationship between Orders and Materials.

| Column Name | Description | Required? | Unique? |
| :--- | :--- | :--- | :--- |
| Order_ID | Links to the specific order (Foreign Key). | Yes | Yes (Composite) |
| Material_ID | Links to the specific material (Foreign Key). | Yes | Yes (Composite) |
| Quantity_Used | How many units of the material were used for this order. | Yes | No |
