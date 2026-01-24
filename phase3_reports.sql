-- Report 1- Vendor Performance analysis(Procurement Intelligence)
-- Business Question(Which vendors are reliable and how efficiently are they supplying materials?)
Select
v.vendor_id,
v.vendor_name,
v.country,
COUNT(po.po_id) as total_pos,
SUM(po.quantity) as total_quantity_supplied,
Avg(po.delivery_days) as avg_delivery_days
from vendors v
join purchase_orders po
on v.vendor_id = po.vendor_id
where po.status = 'RECEIVED'
Group by v.vendor_id, v.vendor_name, v.country
having SUM(po.quantity) > 0;
-- What this shows : Vendor contribution, Delivery efficiency,Dependency risk.
-- “Vendor performance is derived directly from purchase order history, not subjective ratings.”




-- Report 2: Fiscal Year Sales Summary
select
f.fiscal_year,
p.product_name,
SUM(f.quantity) as total_quantity_sold
from fiscal_year_sales f
join products p
on f.product_id = p.product_id
group by f.fiscal_year, p.product_name
order by f.fiscal_year, total_quantity_sold DESC;
-- What this shows: Fiscal year performance, Product demand by FY, Audit-safe reporting (no hardcoding)
-- “Fiscal years are dynamically derived and used consistently across reports.”



-- Report 3: Slow Moving/ Dead Stock Detection(Inventory optimization)
-- Question: Which products are sitting in inventory without recent sales?
-- Logic: Find last sale date per product, Compare against today, Flag risk
select
p.product_id,
p.product_name,
i.storage_location,
i.quantity,
MAX(s.sale_date) AS last_sale_date,
DATEDIFF(CURDATE(), MAX(s.sale_date)) AS days_since_last_sale
from inventory i
join products p
on i.product_id = p.product_id
left join sales_orders s
on i.product_id = s.product_id
group by
p.product_id,
p.product_name,
i.storage_location,
i.quantity
having days_since_last_sale > 30
or last_sale_date is null;
-- What this shows:Slow-moving inventory
-- “Slow-moving stock is detected purely through transactional analysis.



-- Report 4: Stock Consumption Trend(Window Function)
Select
product_id,
sale_date,
quantity,
SUM(quantity) over (
partition by product_id
order by sale_date
)
as running_quantity_sold
from sales_orders
order by product_id, sale_date;
-- What this shows:Running consumption, Demand velocity, Future stock planning signals
-- “Window functions help analyze demand trends."



-- Report 5 - Region wise sales Contribution
select region,
SUM(quantity) as total_units_sold
from sales_orders
group by region
order by total_units_sold desc;
-- “Regional demand trends are derived directly from sales transactions.”
