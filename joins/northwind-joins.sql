USE Northwind;

-- 1. List the product id, product name, unit price and category name of all
-- products. Order by category name and within that, by product name.
SELECT 
	ProductID, 
	ProductName, 
	UnitPrice, 
	CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY CategoryName, ProductName;

-- 2. List the product id, product name, unit price and supplier name of all
-- products that cost more than $75. Order by product name.
SELECT 
	ProductID, 
	ProductName, 
	UnitPrice,
	CompanyName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitPrice > 75
ORDER BY ProductName;

-- 3. List the product id, product name, unit price, category name, and supplier
-- name of every product. Order by product name.
SELECT 
	ProductID, 
	ProductName, 
	UnitPrice,
	CategoryName,
	CompanyName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY ProductName;

-- 4. What is the product name(s) and categories of the most expensive
-- products? HINT: Find the max price in a subquery and then use that in
-- your more complex query that joins products with categories.
SELECT
	ProductName, 
    UnitPrice, 
    CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE ProductID IN (
SELECT ProductID
FROM Products
WHERE UnitPrice > 50
ORDER BY UnitPrice DESC)
ORDER BY UnitPrice DESC, CategoryName, ProductName;

-- 5. List the order id, ship name, ship address, and shipping company name of
-- every order that shipped to Germany.
SELECT 
	OrderID, 
	ShipName, 
	ShipAddress, 
	CompanyName,
    ShipCountry
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE ShipCountry = 'Germany';

-- 6. List the order id, order date, ship name, ship address of all orders that
-- ordered "Sasquatch Ale"?
SELECT 
	Orders.OrderID, 
	OrderDate,
	ShipName, 
	ShipAddress,
	ProductName
FROM Orders
INNER JOIN `Order Details` ON Orders.OrderID = `Order Details`.OrderID
INNER JOIN Products ON `Order Details`.ProductID = Products.ProductID
WHERE Products.ProductName = 'Sasquatch Ale';
