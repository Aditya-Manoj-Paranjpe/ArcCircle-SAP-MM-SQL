USE ArcCircle;


Create table Products (
    Product_id Int primary key,
    Product_name VARCHAR(100) not null,
    category VARCHAR(50),
    Unit_price DECIMAL(10,2) check (Unit_price > 0),
    Plant_id VARCHAR(10),
    created_date DATETIME default current_timestamp,
    material_type ENUM('Raw','Semi-finished','Finished')
);


create table Vendors (
    Vendor_id int primary key,
    Vendor_name varchar(100) not null,
    Country varchar(50),
    Purchasing_Org varchar(10),       -- SAP Purchasing Org
    lead_time_days int check (lead_time_days > 0)
);


create table Inventory (
    product_id int,
    storage_location varchar(20),
    quantity int check (quantity >= 0),
    last_updated datetime,
    primary key (product_id, storage_location),
    constraint fk_inv_product
        foreign key(product_id) references Products(product_id)
);


create table Purchase_Orders (
    po_id int primary key,
    product_id int,
    vendor_id int,
    plant_id varchar(10),
    quantity int check (quantity > 0),
    order_date date,
    delivery_days int,
    status VARCHAR(20) CHECK (status in ('ORDERED','RECEIVED')),
    foreign key (product_id) references Products(product_id),
    foreign key (vendor_id) references Vendors(vendor_id)
);


create table Sales_Orders (
    so_id int primary key,
    product_id int,
    plant_id varchar(10),
    storage_location varchar(10),
    quantity int check (quantity > 0),
    sale_date date,
    region VARCHAR(50),
    foreign key (product_id) references Products(product_id)
);
