USE Northwind;

INSERT INTO Categories (CategoryName, Description)
VALUES ("Software", "Software products for enterprise.");

-- 1. Add a new supplier.
INSERT INTO Suppliers (CompanyName, PostalCode)
VALUES ('Microsoft', 98052);

-- 2. Add a new product provided by that supplier.
INSERT INTO Products (ProductName,SupplierID, CategoryID, UnitPrice)
VALUES ("Microsoft Office 365", 30, 9, 99.99);

-- 3. List all products and their suppliers.
SELECT *
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- 4. Raise the price of your new product by 15%.
UPDATE Products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductID = 79;

-- 5. List the products and prices of all products from that supplier.
SELECT CompanyName, ProductID, ProductName, UnitPrice
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE CompanyName = 'Microsoft';

-- 6. Delete the new product.
DELETE FROM Products
WHERE ProductName = 'Microsoft Office 365';

-- 7. Delete the new supplier.
DELETE FROM Suppliers
WHERE CompanyName = 'Microsoft';


-- 8. List all products.
SELECT *
FROM Products;

-- 9. List all suppliers.
SELECT *
FROM Suppliers;
