CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE Dealers (
    dealer_id INT PRIMARY KEY,
    dealer_name VARCHAR(100),
    contact_number VARCHAR(20)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    reorder_threshold INT
);

-- Create Operational Tables
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    branch_id INT REFERENCES Branches(branch_id),
    product_id INT REFERENCES Products(product_id),
    stock_on_hand INT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    dealer_id INT REFERENCES Dealers(dealer_id),
    branch_id INT REFERENCES Branches(branch_id),
    product_id INT REFERENCES Products(product_id),
    qty_ordered INT,
    order_date DATE,
    status VARCHAR(20)
);