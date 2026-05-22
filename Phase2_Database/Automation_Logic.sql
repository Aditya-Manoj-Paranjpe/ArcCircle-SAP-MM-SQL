DELIMITER $$
CREATE PROCEDURE update_inventory_po (
    IN p_product_id INT,
    IN p_storage_location VARCHAR(10),
    IN p_quantity INT
)
BEGIN
    INSERT INTO inventory (product_id, storage_location, quantity, last_updated)
    VALUES (p_product_id, p_storage_location, p_quantity, NOW())
    ON DUPLICATE KEY UPDATE
        quantity = quantity + p_quantity,
        last_updated = NOW();
END$$
DELIMITER ;





DELIMITER $$
CREATE TRIGGER before_sales_insert
BEFORE INSERT ON sales_orders
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;

    SELECT quantity INTO current_stock
    FROM inventory
    WHERE product_id = NEW.product_id
    AND storage_location = NEW.storage_location
    LIMIT 1;

    IF current_stock IS NULL OR current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for sales order';
    END IF;
END$$
DELIMITER ;




DELIMITER $$
create trigger after_sales_insert
after insert on sales_orders
for each row
BEGIN
update inventory
set quantity = quantity - new.quantity,
last_updated = NOW()
where product_id = new.product_id
and storage_location = new.storage_location;
END$$
DELIMITER ;
-- “Stock reduction happens automatically after successful sales posting.”
-- AFTER SALES TRIGGER — Auto Stock Reduction






create view fiscal_year_sales as
select
so_id,
product_id,
quantity,
sale_date,
case
when month(sale_date) >= 4
then CONCAT(YEAR(sale_date), '-', YEAR(sale_date)+1)
else CONCAT(YEAR(sale_date)-1, '-', YEAR(sale_date))
END AS fiscal_year
FROM sales_orders;
-- Business Rule: Indian FY: April 1 - March 31, Fiscal years are derived dynamically






DELIMITER $$
CREATE PROCEDURE stock_risk_check ()
BEGIN
    SELECT 
        product_id,
        quantity,
        CONCAT('Reorder required for product ', product_id) AS alert
    FROM inventory
    WHERE quantity < 100;
END$$
DELIMITER ;
