-- create table sales

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,                           -- Unique identifier for each row
    ficheno INT NOT NULL,                            -- Invoice or transaction number
    date_ TIMESTAMP NOT NULL,                         -- Date and time of the sale
    item_code INT NOT NULL,                          -- Item code
    item_name VARCHAR(255) NOT NULL,                 -- Item name
    brand VARCHAR(100) NOT NULL,                     -- Brand name
    category1 VARCHAR(100) NOT NULL,                 -- Main category
    category2 VARCHAR(100),                          -- Subcategory 1
    category3 VARCHAR(100),                          -- Subcategory 2
    category4 VARCHAR(100),                          -- Subcategory 3
    amount INT NOT NULL,                             -- Quantity of the item sold
    price DECIMAL(15, 2) NOT NULL,                   -- Price per unit
    total_price DECIMAL(15, 2) NOT NULL,             -- Total price (amount * price)
    customer_code INT NOT NULL,                      -- Customer code
    customer_name VARCHAR(255) NOT NULL,             -- Customer name
    customer_birthdate DATE,                         -- Customer's date of birth
    customer_gender CHAR(1),                         -- Customer's gender ('E' for Male, 'K' for Female)
    branch VARCHAR(100),                             -- Branch where the sale occurred
    city VARCHAR(100) NOT NULL,                      -- City of the branch
    district VARCHAR(100),                           -- District of the branch
    region VARCHAR(100)                              -- Region of the branch
);

select * from sales