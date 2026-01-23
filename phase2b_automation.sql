DELIMITER $$
create procedure update_inventory_po (
in p_product_id int,
in p_storage_location varchar(10),
in p_quantity int
)
begin
update inventory
set quantity = quantity + p_quantity,
last_updated = NOW()
where product_id = p_product_id
and storage_location = p_storage_location;
END$$
DELIMITER ;


DELIMITER $$
create trigger before_sales_insert
before insert on sales_orders
for each row
BEGIN
declare current_stock int;
select quantity
into current_stock
from inventory
where product_id = new.product_id
and storage_location = new.storage_location;
IF current_stock is null or current_stock < NEW.quantity then
signal sqlstate '45000'
set MESSAGE_TEXT = 'Insufficient stock for sales order';
END if;
END$$
DELIMITER ;
-- Before Sales Trigger — Stock Validation


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
-- Business Rule: Indian FY: April 1 - March 31, Fiscal years are dervied dynamically 



DELIMITER $$
create procedure stock_risk_check ()
BEGIN
declare done INT DEFAULT 0;
declare p_id INT;
declare cur CURSOR FOR
select product_id from inventory where quantity < 100;
declare continue handler for not found set done = 1;

open cur;

read_loop: while done = 0 do
fetch cur into p_id;

if done = 1 then
leave read_loop;
END IF;

-- Business action placeholder
select CONCAT('Reorder required for product ', p_id) as alert;
END WHILE;

close cur;
END$$

DELIMITER ;
