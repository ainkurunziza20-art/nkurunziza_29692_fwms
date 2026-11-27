Microsoft Windows [Version 10.0.26300.10075]
(c) Microsoft Corporation. All rights reserved.

C:\Windows\System32>sqlplus nkurunziza_admin/nkurunziza@localhost:1521/grpi_29692_nkurunziza_fwms_db

SQL*Plus: Release 21.0.0.0.0 - Production on Fri Nov 27 15:15:41 2026
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Last Successful login time: Sun Nov 22 2026 16:31:24 +02:00

Connected to:
Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> INSERT INTO workers (worker_name, role) VALUES ('Test Worker', 'Doctor');
INSERT INTO workers (worker_name, role) VALUES ('Test Worker', 'Doctor')
*
ERROR at line 1:
ORA-02290: check constraint (NKURUNZIZA_ADMIN.CK_WORKERS_ROLE) violated


SQL> INSERT INTO customers (name, phone, district) VALUES ('Copycat', '0781234567', 'Kigali');

1 row created.

SQL> DELETE FROM customers WHERE customer_id = 1;
DELETE FROM customers WHERE customer_id = 1
*
ERROR at line 1:
ORA-02292: integrity constraint (NKURUNZIZA_ADMIN.FK_ORDERS_CUSTOMERS) violated
- child record found


SQL> -- Check how many materials are linked to Order 1
SQL> SELECT COUNT(*) FROM order_materials WHERE order_id = 1;

  COUNT(*)
----------
         0

SQL>
SQL> -- Delete the order
SQL> DELETE FROM orders WHERE order_id = 1;

0 rows deleted.

SQL>
SQL> -- Check again (Should be 0 now!)
SQL> SELECT COUNT(*) FROM order_materials WHERE order_id = 1;

  COUNT(*)
----------
         0

SQL>
SQL> -- Undo the delete so we don't lose data
SQL> ROLLBACK;

Rollback complete.

SQL> INSERT INTO customers (name, phone, district) VALUES ('Copycat 2', '0781234567', 'Kigali');

1 row created.

SQL> SELECT order_id, COUNT(*) FROM order_materials GROUP BY order_id FETCH FIRST 1 ROWS ONLY;

  ORDER_ID   COUNT(*)
---------- ----------
         8          1

SQL> -- 1. See the materials
SQL> SELECT COUNT(*) FROM order_materials WHERE order_id = 2;

  COUNT(*)
----------
         0

SQL>
SQL> -- 2. Delete the parent order
SQL> DELETE FROM orders WHERE order_id = 2;

0 rows deleted.

SQL>
SQL> -- 3. See the materials disappear!
SQL> SELECT COUNT(*) FROM order_materials WHERE order_id = 2;

  COUNT(*)
----------
         0

SQL>
SQL> -- 4. Undo the delete
SQL> ROLLBACK;

Rollback complete.

SQL> -- 1. See the materials for Order 8 (It should say 1)
SQL> SELECT COUNT(*) FROM order_materials WHERE order_id = 8;

  COUNT(*)
----------
         1

SQL>
SQL> -- 2. Delete Order 8
SQL> DELETE FROM orders WHERE order_id = 8;

1 row deleted.

SQL>
SQL> -- 3. See the materials disappear! (It should say 0)
SQL> SELECT COUNT(*) FROM order_materials WHERE order_id = 8;

  COUNT(*)
----------
         0

SQL>
SQL> -- 4. Undo the delete
SQL> ROLLBACK;

Rollback complete.

SQL>
