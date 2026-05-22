INSERT INTO Products (product_name, category, unit_price, plant_id, material_type)
VALUES 
('Basmati Rice 5kg','Grocery',24.50,'ARC_PL01','Finished'),2
('Wheat Flour 10kg','Grocery',18.75,'ARC_PL01','Finished'),
('LED Bulb 9W','Electronics',3.20,'ARC_PL02','Finished'),
('Custom Snack Box','Grocery',15.00,'ARC_PL01','Semi-finished');
SELECT * FROM Products;


INSERT INTO Vendors (vendor_name, country, purchasing_org, lead_time_days)
VALUES
('AgroFoods Ltd','India','ARC_PO01',7),
('Bright Electronics','China','ARC_PO01',15);
SELECT * FROM Vendors;


INSERT INTO Inventory (product_id, storage_location, quantity, last_updated)
VALUES
(1,'SL_001',500,NOW()),
(2,'SL_001',300,NOW()),
(3,'SL_002',800,NOW()),
(4,'SL_001',100,NOW());
SELECT * FROM Inventory;


INSERT INTO Purchase_Orders (product_id, vendor_id, plant_id, quantity, order_date, delivery_days, status)
VALUES
(1,1,'ARC_PL01',200,DATE_SUB(CURDATE(), INTERVAL 10 DAY),7,'Received'),
(2,1,'ARC_PL01',500,DATE_SUB(CURDATE(), INTERVAL 10 DAY),14,'Received'),
(3,2,'ARC_PL02',300,DATE_SUB(CURDATE(), INTERVAL 10 DAY),7,'Received');
SELECT * FROM Purchase_Orders;


INSERT INTO Sales_Orders (product_id, plant_id, storage_location, quantity, sale_date, region)
VALUES
(1,'ARC_PL01','SL_001',50,DATE_ADD(CURDATE(), INTERVAL 3 DAY),'North'),
(2,'ARC_PL01','SL_001',30,DATE_ADD(CURDATE(), INTERVAL 4 DAY),'West'),
(3,'ARC_PL02','SL_002',70,DATE_ADD(CURDATE(), INTERVAL 5 DAY),'East'),
(4,'ARC_PL01','SL_001',20,DATE_ADD(CURDATE(), INTERVAL 6 DAY),'South');
SELECT * FROM Sales_Orders;

