insert into Products
(product_id, product_name, category, unit_price, plant_id, created_date, material_type)
Values
(101,'Basmati Rice 5kg','Grocery',24.50,'ARC_PL01',NOW(),'Finished'),
(102,'Wheat Flour 10kg','Grocery',18.75,'ARC_PL01',NOW(),'Finished'),
(103,'LED Bulb 9W','Electronics',3.20,'ARC_PL02',NOW(),'Finished'),
(104,'Custom Snack Box','Grocery',15.00,'ARC_PL01',NOW(),'Semi-finished');


insert into Vendors
(vendor_id, vendor_name, country, purchasing_org, lead_time_days)
values
(201,'AgroFoods Ltd','India','ARC_PO01',7),
(202,'Bright Electronics','China','ARC_PO01',15);


insert into Inventory
(product_id, storage_location, quantity, last_updated)
VALUES
(101,'SL_001',500,NOW()),
(102,'SL_001',300,NOW()),
(103,'SL_002',800,NOW());


insert into Purchase_Orders
(po_id, product_id, vendor_id, plant_id, quantity, order_date, delivery_days, status)
values
(301,101,201,'ARC_PL01',200,DATE_SUB(CURDATE(),interval 10 day),7,'Received'),
(302,102,201,'ARC_PL01',500,DATE_SUB(CURDATE(),interval 10 day),14,'Received'),
(303,103,202,'ARC_PL01',300,DATE_SUB(CURDATE(),interval 10 day),7,'Received');


insert into Sales_Orders
(so_id, product_id, plant_id, storage_location, quantity, sale_date, region)
values
(401,101,'ARC_PL01','SL_001',50,DATE_ADD(CURDATE(),interval 3 DAY),'North'),
(402,102,'ARC_PL01','SL_001',30, DATE_ADD(CURDATE(),interval 4 DAY),'West'),
(403,103,'ARC_PL02','SL_002',70, DATE_ADD(CURDATE(),interval 5 DAY),'East'),
(404,104,'ARC_PL01','SL_001',20, DATE_ADD(CURDATE(),interval 6 DAY),'South');

