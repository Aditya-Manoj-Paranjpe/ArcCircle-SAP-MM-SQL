
-- ===========================================
-- HOW TO READ RESULTS:
-- When you run these tests, look at the "Result Grid" in MySQL Workbench.
-- I have labeled outputs as 'BEFORE' and 'AFTER' so you can see the 
-- inventory changing in real-time as the triggers execute.
-- ============================================

-- ============================================
-- Project: ArcCircle SAP-MM Enterprise Suite
-- Purpose: Business Logic Test
-- This script tests Triggers, Stored Procedures, and Data Integrity.
-- =============================================

-- ==============
-- Use This Database
USE ArcCircle;
-- ==============

-- =========================================
-- TEST 1
-- Scenario: Successful sales order posting
-- Logic: Validates stock availability and verifies automatic inventory reduction through trigger execution.
-- =========================================

START TRANSACTION;

SELECT quantity 
FROM Inventory 
WHERE product_id = 1 AND storage_location = 'SL_001';

INSERT INTO Sales_Orders (product_id, plant_id, storage_location, quantity, sale_date, region)
VALUES (1, 'ARC_PL01', 'SL_001', 50, CURDATE(), 'North');

SELECT quantity 
FROM Inventory 
WHERE product_id = 1 AND storage_location = 'SL_001';

ROLLBACK; -- Undo changes for repeat testing


-- =========================================
-- TEST 2
-- Scenario: Sales order blocked due to insufficient stock
-- Logic: BEFORE INSERT trigger prevents order creation when requested quantity exceeds available inventory.
-- =========================================

START TRANSACTION;

SELECT quantity 
FROM Inventory 
WHERE product_id = 2 AND storage_location = 'SL_001';

INSERT INTO Sales_Orders (product_id, plant_id, storage_location, quantity, sale_date, region)
VALUES (2, 'ARC_PL01', 'SL_001', 1000, CURDATE(), 'West');

ROLLBACK;


-- =========================================
-- TEST 3
-- Scenario: Sales order for non-existent inventory location
-- Logic: Trigger validation fails because no inventory record exists for the requested product and storage location.
-- =========================================

START TRANSACTION;

SELECT * 
FROM Inventory 
WHERE product_id = 999 AND storage_location = 'SL_999';

INSERT INTO Sales_Orders (product_id, plant_id, storage_location, quantity, sale_date, region)
VALUES (999, 'ARC_PL01', 'SL_999', 1, CURDATE(), 'North');

ROLLBACK;



-- =========================================
-- TEST 4
-- Scenario: Purchase order inventory replenishment
-- Logic: Stored procedure updates inventory automatically after simulated goods receipt posting.
-- =========================================

START TRANSACTION;

SELECT quantity 
FROM Inventory 
WHERE product_id = 3 AND storage_location = 'SL_002';

CALL update_inventory_po(3, 'SL_002', 100);

SELECT quantity 
FROM Inventory 
WHERE product_id = 3 AND storage_location = 'SL_002';

ROLLBACK;


-- =========================================
-- TEST 5
-- Scenario: Low inventory risk detection
-- Logic: Stock monitoring procedure identifies products below reorder threshold and generates alert messages.
-- =========================================

START TRANSACTION;

UPDATE Inventory
SET quantity = 50
WHERE product_id = 1 AND storage_location = 'SL_001';

CALL stock_risk_check();

ROLLBACK;

SELECT * FROM Inventory WHERE quantity < 100;


-- ---------------------------------------------------------
-- FINAL SYSTEM CHECK
-- View the state of the enterprise data
-- ---------------------------------------------------------
SELECT * FROM Inventory;
SELECT * FROM Sales_Orders;
SELECT * FROM Material_Master;
