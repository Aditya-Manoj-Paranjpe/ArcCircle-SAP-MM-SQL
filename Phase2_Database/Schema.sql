USE ArcCircle;

-- =========================
-- PRODUCTS (Material Master)
-- =========================
Create table Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) CHECK (unit_price > 0),
    plant_id VARCHAR(10),
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    material_type ENUM('Raw','Semi-finished','Finished')
);


-- =========================
-- VENDORS (Business Partner)
-- =========================
CREATE TABLE Vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    purchasing_org VARCHAR(10),   -- SAP Purchasing Org
    lead_time_days INT CHECK (lead_time_days > 0)
);


-- =========================
-- INVENTORY (Stock Table)
-- =========================
CREATE TABLE Inventory (
    product_id INT,
    storage_location VARCHAR(20),
    quantity INT CHECK (quantity >= 0),
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id, storage_location),
    CONSTRAINT fk_inv_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =========================
-- PURCHASE ORDERS
-- =========================
CREATE TABLE Purchase_Orders (
    po_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    vendor_id INT,
    plant_id VARCHAR(10),
    quantity INT CHECK (quantity > 0),
    order_date DATE DEFAULT (CURRENT_DATE),
    delivery_days INT,
    status VARCHAR(20) CHECK (status IN ('Ordered','Received')),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id)
);


-- =========================
-- SALES ORDERS
-- =========================
CREATE TABLE Sales_Orders (
    so_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    plant_id VARCHAR(10),
    storage_location VARCHAR(10),
    quantity INT CHECK (quantity > 0),
    sale_date DATE DEFAULT (CURRENT_DATE),
    region VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


