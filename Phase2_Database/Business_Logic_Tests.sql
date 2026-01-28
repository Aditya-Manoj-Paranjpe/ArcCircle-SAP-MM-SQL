
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

-- ---------------------------------------------------------
-- TEST 1: Sales Order Success & Auto-Inventory Reduction
-- Scenario: Selling 50 units of Product 101.
-- Logic: AFTER INSERT Trigger should reduce Inventory quantity.
-- ---------------------------------------------------------
START TRANSACTION;

-- View stock before
select 'BEFORE' as Status, quantity from Inventory where product_id = 101 and storage_location = 'SL_001';

Insert into Sales_Orders (so_id, product_id, plant_id, storage_location, quantity, sale_date, region)
values (501, 101, 'ARC_PL01', 'SL_001', 50, CURDATE(), 'North');

-- View stock after (Should be 50 units less)
select 'AFTER' as Status, quantity from Inventory where product_id = 101 AND storage_location = 'SL_001';

ROLLBACK; -- Undo changes for repeat testing


-- ---------------------------------------------------------
-- TEST 2: Sales Order Failure (Stock Protection)
-- Scenario: Attempting to sell 1000 units when only 500 exist.
-- Logic: BEFORE INSERT Trigger should throw a SIGNAL error.
-- ---------------------------------------------------------
START TRANSACTION;

-- This statement should fail with: "Insufficient stock for sales order"
insert into Sales_Orders (so_id, product_id, plant_id, storage_location, quantity, sale_date, region)
values (502, 102, 'ARC_PL01', 'SL_001', 1000, CURDATE(), 'West');

ROLLBACK;


-- ---------------------------------------------------------
-- TEST 3: Purchase Order / Goods Receipt (MIGO Simulation)
-- Scenario: Receiving 100 units from a vendor.
-- Logic: Stored Procedure should update Inventory seamlessly.
-- ---------------------------------------------------------
START TRANSACTION;

select 'BEFORE' as Status, quantity from Inventory where product_id = 103 and storage_location = 'SL_002';

-- Simulate Goods Receipt
call update_inventory_po(103, 'SL_002', 100);

select 'AFTER' as Status, quantity from Inventory where product_id = 103 AND storage_location = 'SL_002';

ROLLBACK;


-- ---------------------------------------------------------
-- TEST 4: Stock Risk Alert (Safety Stock Logic)
-- Scenario: Checking which items are below the safety threshold.
-- ---------------------------------------------------------
START TRANSACTION;

-- Force a low stock scenario
update Inventory set quantity = 45 where product_id = 101 and storage_location = 'SL_001';

-- Run Risk Analysis Procedure
call stock_risk_check();

ROLLBACK;


-- ---------------------------------------------------------
-- FINAL SYSTEM CHECK
-- View the state of the enterprise data
-- ---------------------------------------------------------
SELECT * FROM Inventory;
SELECT * FROM Sales_Orders;
SELECT * FROM Material_Master;
