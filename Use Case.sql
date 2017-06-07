SET AUTOCOMMIT = FALSE;
-- USE CASE 1
-- Find the amount of deducted price of retailer's Invoice total price based on the retailer's discount percentage

SELECT invoiceNumber, retailerID, (discountPercentage / 100) * totalPrice AS DiscountedAmount, totalPrice
FROM Retailer NATURAL JOIN Invoice
WHERE retailerID = 10003001;


-- USE CASE 2
-- Set the paymentStatus of GoodsOrderInvoice with invoiceNumber of 100001 to 'PAID' by matching the amountPaid with totalPrice and let the trigger does its job

UPDATE GoodsOrderInvoice
SET amountPaid = 1000
WHERE invoiceNumber = 100001;

SELECT paymentStatus AS StatusOfPayment
FROM GoodsOrderInvoice
WHERE invoiceNumber = 100001;


-- USE CASE 3
-- Customer place an order to buy 2 goods, the totalPrice will be automatically calculated based on the quantity and quotedPrice in the OrderDetails.

INSERT INTO Orders (orderID, customerID, empID, totalPrice, orderDate) 
VALUES(100011, 10002004, 10001003, 0, '2017-06-01');
INSERT INTO OrderDetails (orderID, goodsID, quotedPrice, quantity) 
VALUES(100011, 1001, 12, 3);
INSERT INTO OrderDetails (orderID, goodsID, quotedPrice, quantity) 
VALUES(100011, 1003, 7, 5);

UPDATE Goods 
SET currentStock = currentStock - 3
WHERE goodsID = 10001;
UPDATE Goods
SET currentStock = currentStock - 5
WHERE goodsID = 1003;

SELECT * FROM orders
WHERE orderID = 100011;


-- USE CASE 4
-- Retailer place an order to buy 2 goods, the totalprice will be updated based on the quotedPrice, quantity and discountPercentage in the InvoiceLine, the paymentStatus will also be updated based on the amountPaid. Then select the totalPrice, discountPercentage, paymentStatus and AmountDeducted by the discount.

INSERT INTO Invoice (invoiceNumber, retailerID, empID, totalPrice, amountPaid, paymentStatus, orderDate) 
VALUES(100011, 10003005, 10001003, 0, 0, 'PENDING', '2017-06-29');
INSERT INTO InvoiceLine (invoiceNumber, goodsID, quotedPrice, quantity) VALUES
(100011, 1007, 8, 3),
(100011, 1009, 15, 2);

UPDATE Goods
SET currentStock = currentStock - 3
WHERE goodsID = 1007;
Update Goods
SET currentStock = currentStock - 2
WHERE goodsID = 1009;

SELECT InvoiceNumber, retailerID, totalPrice, amountPaid, discountPercentage AS Discount, (discountPercentage / 100) * totalPrice AS AmountDeducted 
FROM Invoice NATURAL JOIN Retailer
WHERE invoiceNumber = 100011;


-- USE CASE 5
-- Search all goods which are categorized under cigarettes and sort by the sell price

SELECT goodsName AS CigaretteName, currentStock as AvailableStock, CONCAT(warehouseName, ' In ',warehouseAddress) AS StoredAt,
	categoryName AS GoodsType, sellPrice AS PriceEach
FROM Goods NATURAL JOIN Warehouse NATURAL JOIN GoodsCategory
WHERE categoryID = 102
ORDER BY sellPrice DESC;


-- USE CASE 6
-- Find all salary specification for employee, this include their employee salary, role salary and total salary. and then sort
-- by the total salary.

SELECT empID AS EmployeeID, empName AS EmployeeName, roleID AS RoleID, roleName AS WorkRole, workTime AS TotalWorkTime,
	empSalary AS EmployeeSalary, roleSalary AS RoleSalary, totalSalary AS TotalSalary
FROM Employee NATURAL JOIN Salary NATURAL JOIN WorkRole
ORDER BY totalSalary;


-- USE CASE 7
-- Find distributor and employee that has the same address and display only those who have same address

SELECT empID AS EmployeeID, empName AS EmployeeName, distributorID AS DistributorID, distributorName AS DistributorName,
	distributorAddress AS Address
FROM Employee JOIN Distributor
ON empAddress = distributorAddress;


-- USE CASE 8
-- Order goods from distributor and pay it partially without changing the default value of paymentStatus, 
-- then see the paymentStatus automatically updated to match the changes

INSERT INTO GoodsOrderInvoice (invoiceNumber, distributorID, amountPaid, paymentStatus, deliveryDate) 
VALUES(100011, 10000005, 500, 'PENDING', '2017-05-01');
INSERT INTO GoodsInvoiceLine (invoiceNumber, goodsID, quotedPrice, quantity) 
VALUES(100011, 1001, 10, 300);

UPDATE Goods 
SET currentStock = currentStock + 300
WHERE goodsID = 1001;

SELECT * FROM GoodsOrderInvoice
WHERE invoiceNumber = 100011;


-- USE CASE 9
-- Calculate the profit of selling goods and the percentage of difference between the buy price and sell
-- price of the goods

SELECT goodsID, goodsName, quotedPrice as BuyPrice, sellPrice AS SellPrice, (sellPrice - quotedPrice) * 10 AS PercentageProfit
FROM Goods NATURAL JOIN GoodsInvoiceLine
ORDER BY goodsID;


-- USE CASE 10
-- calculate the profit of selling goods to each retailer and display the details

SELECT goodsID, goodsName, retailerID, retailerName, discountPercentage AS Discount, 
	sellPrice * ((100 - discountPercentage)/100) AS SellPrice, (sellPrice * ((100 - discountPercentage)/100) - GoodsInvoiceLine.quotedPrice) AS Profit
FROM Goods NATURAL JOIN Retailer NATURAL JOIN GoodsInvoiceLine
ORDER BY goodsID DESC;



















