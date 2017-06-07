DROP DATABASE IF EXISTS WholesaleManagement;
CREATE DATABASE WholesaleManagement;
USE WholesaleManagement;

CREATE TABLE Distributor(
	distributorID INT(8) PRIMARY KEY,
    distributorName VARCHAR(30) NOT NULL,
    distributorAddress VARCHAR(40) NOT NULL,
	distributorCity VARCHAR(20) NOT NULL,
	distributorPostCode INT(5) NOT NULL,
	phoneNumber CHAR(11) NOT NULL
);

CREATE TABLE GoodsCategory(
	categoryID INT(3) PRIMARY KEY,
    categoryName VARCHAR(20) NOT NULL,
    description VARCHAR(30)
);

CREATE TABLE Warehouse(
	warehouseID INT(2) PRIMARY KEY,
	warehouseName VARCHAR(30) NOT NULL,
	warehouseAddress VARCHAR(40) NOT NULL
);

CREATE TABLE Goods(
	goodsID INT(4) PRIMARY KEY,
    categoryID INT,
	warehouseID INT NOT NULL,
    goodsName VARCHAR(50) NOT NULL,
    currentStock INT(4) NOT NULL,
    sellPrice DOUBLE,
    
	FOREIGN KEY(warehouseID) REFERENCES Warehouse(warehouseID),
    FOREIGN KEY(categoryID) REFERENCES GoodsCategory(categoryID) 
);

CREATE TABLE GoodsOrderInvoice(
	invoiceNumber INT(6) primary key AUTO_INCREMENT,
	distributorID INT NOT NULL,
	totalPrice DOUBLE DEFAULT 0,
	amountPaid DOUBLE DEFAULT 0,
	paymentStatus CHAR(7) NOT NULL DEFAULT 'PENDING',
	deliveryDate DATE NOT NULL,
	
	FOREIGN KEY(distributorID) REFERENCES Distributor(distributorID)
);

CREATE TABLE GoodsInvoiceLine(
	invoiceNumber INT,
	goodsID INT,
	quotedPrice DOUBLE NOT NULL,
	quantity INT(3) NOT NULL,
	
	PRIMARY KEY(invoiceNumber, goodsID),
	FOREIGN KEY(invoiceNumber) REFERENCES GoodsOrderInvoice(invoiceNumber),
	FOREIGN KEY(goodsID) REFERENCES Goods(goodsID)
);

CREATE TABLE WorkRole(
	roleID INT(3) PRIMARY KEY,
    roleName VARCHAR(20) NOT NULL,
    workTime INT(2) NOT NULL,
    roleSalary INT(4) NOT NULL
);

CREATE TABLE Employee(
	empID INT(8) PRIMARY KEY,
    roleID INT NOT NULL,
    empName VARCHAR(30) NOT NULL,
	empAddress VARCHAR(40) NOT NULL,
    phoneNumber CHAR(11) NOT NULL,
    
    FOREIGN KEY(roleID) REFERENCES WorkRole(roleID)
);

CREATE TABLE Salary(
	empID INT,
    roleID INT,
    empSalary INT(4) NOT NULL,
    totalSalary INT(4) DEFAULT 0,
    startDate DATE NOT NULL,
    
    PRIMARY KEY(empID),
    FOREIGN KEY(empID) REFERENCES Employee(empID),
    FOREIGN KEY(roleID) REFERENCES WorkRole(roleID)
);

CREATE TABLE Retailer(
	retailerID INT(8) PRIMARY KEY,
	retailerName VARCHAR(30) NOT NULL,
	retailerAddress VARCHAR(40) NOT NULL,
	discountPercentage INT(2) NOT NULL DEFAULT 2,
	phoneNumber CHAR(11) NOT NULL
);

CREATE TABLE Customer(
	customerID INT(8) PRIMARY KEY,
	customerName VARCHAR(30) NOT NULL
);

CREATE TABLE Orders(
	orderID INT(6) PRIMARY KEY AUTO_INCREMENT,
	customerID INT NOT NULL,
	empID INT NOT NULL,
	totalPrice DOUBLE DEFAULT 0,
	orderDate DATE,
	
	FOREIGN KEY(customerID) REFERENCES Customer(customerID),
	FOREIGN KEY(empID) REFERENCES Employee(empID)
);

CREATE TABLE OrderDetails(
	orderID INT,
	goodsID INT,
	quotedPrice DOUBLE NOT NULL,
	quantity INT(3) NOT NULL,
	
	PRIMARY KEY(goodsID, orderID),
	FOREIGN KEY(orderID) REFERENCES Orders(orderID),
	FOREIGN KEY(goodsID) REFERENCES Goods(goodsID)
);

CREATE TABLE Invoice(
	invoiceNumber INT(6) PRIMARY KEY,
	retailerID INT NOT NULL,
	empID INT NOT NULL,
	totalPrice DOUBLE DEFAULT 0,
	amountPaid DOUBLE DEFAULT 0,
	paymentStatus CHAR(7) DEFAULT 'PENDING',
	orderDate DATE,
	
	FOREIGN KEY(retailerID) REFERENCES Retailer(retailerID),
	FOREIGN KEY(empID) REFERENCES Employee(empID)
);

CREATE TABLE InvoiceLine(
	invoiceNumber INT,
	goodsID INT,
	quotedPrice DOUBLE NOT NULL,
	quantity INT(3) NOT NULL,
	
	PRIMARY KEY(invoiceNumber, goodsID),
	FOREIGN KEY(invoiceNumber) REFERENCES Invoice(invoiceNumber),
	FOREIGN KEY(goodsID) REFERENCES Goods(goodsID)
);

ALTER TABLE GoodsOrderInvoice
	ADD CONSTRAINT paymentStatus CHECK (paymentStatus = 'PAID' OR paymentStatus = 'PENDING' OR paymentStatus = 'PARTIAL' OR paymentStatus = 'INVALID');

ALTER TABLE Invoice
	ADD CONSTRAINT paymentStatus CHECK (paymentStatus = 'PAID' OR paymentStatus = 'PENDING' OR paymentStatus = 'PARTIAL' OR paymentStatus = 'INVALID');

DROP TRIGGER IF EXISTS TotalPriceGoodsOrderInvoice;
DELIMITER %
CREATE TRIGGER TotalPriceGoodsOrderInvoice
AFTER INSERT ON GoodsInvoiceLine
FOR EACH ROW
BEGIN
	UPDATE GoodsOrderInvoice
	SET totalPrice = totalPrice + (NEW.quantity * NEW.quotedPrice) WHERE NEW.invoiceNumber = invoiceNumber;
END
%
DELIMITER ;


DROP TRIGGER IF EXISTS TotalPriceInvoice;
DELIMITER %
CREATE TRIGGER TotalPriceInvoice
AFTER INSERT ON InvoiceLine
FOR EACH ROW
BEGIN
	DECLARE currentDiscount DOUBLE DEFAULT 0;
    SELECT discountPercentage INTO currentDiscount FROM Retailer WHERE retailerID = (SELECT retailerID FROM Invoice where new.invoiceNumber = invoiceNumber);
	UPDATE Invoice
	SET totalPrice = totalPrice + ((NEW.quantity * NEW.quotedPrice) * ((100 - currentDiscount) / 100)) WHERE NEW.invoiceNumber = invoiceNumber;
END
%
DELIMITER ;

DROP TRIGGER IF EXISTS TotalPriceOrders;
DELIMITER %
CREATE TRIGGER TotalPriceOrders
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
	UPDATE Orders
	SET totalPrice = totalPrice + (NEW.quantity * NEW.quotedPrice) WHERE NEW.orderID = orderID;
END
%
DELIMITER ;

DROP TRIGGER IF EXISTS EmployeeTotalSalary;
DELIMITER %
CREATE TRIGGER `EmployeeTotalSalary` BEFORE INSERT ON `salary`
 FOR EACH ROW BEGIN
	DECLARE thisRoleSalary integer;
	SELECT roleSalary INTO thisRoleSalary FROM WorkRole WHERE NEW.roleID = workrole.roleID;
	SET NEW.totalSalary = (NEW.empSalary + thisRoleSalary);
END
%
DELIMITER ;

DROP TRIGGER IF EXISTS PaymentStatusGoodsOrder;
DELIMITER %
CREATE TRIGGER PaymentStatusGoodsOrder
BEFORE INSERT ON GoodsOrderInvoice
FOR EACH ROW
BEGIN
	IF(NEW.amountPaid = 0) THEN
		SET NEW.paymentStatus = 'PENDING' ;
    END IF;
	IF(NEW.amountPaid > 0) THEN
		SET NEW.paymentStatus = 'PARTIAL';
	END IF;
	IF(NEW.amountPaid = NEW.totalPrice && NEW.totalPrice != 0) THEN
		SET NEW.paymentStatus = 'PAID' ;
    END IF;
	IF(NEW.amountPaid > NEW.totalPrice) THEN
		SET NEW.paymentStatus = 'INVALID';
	END IF;
END
%
DELIMITER ;

DROP TRIGGER IF EXISTS PaymentStatusUpdateGoodsOrder;
DELIMITER %
CREATE TRIGGER PaymentStatusUpdateGoodsOrder
BEFORE UPDATE ON GoodsOrderInvoice
FOR EACH ROW
BEGIN
	IF(NEW.amountPaid = 0) THEN
		SET NEW.paymentStatus = 'PENDING' ;
    END IF;
	IF(NEW.amountPaid > 0) THEN
		SET NEW.paymentStatus = 'PARTIAL';
	END IF;
	IF(NEW.amountPaid = NEW.totalPrice && NEW.totalPrice != 0) THEN
		SET NEW.paymentStatus = 'PAID' ;
    END IF;
	IF(NEW.amountPaid > NEW.totalPrice) THEN
		SET NEW.paymentStatus = 'INVALID';
	END IF;
END
%
DELIMITER ;

DROP TRIGGER IF EXISTS PaymentStatusInvoice;
DELIMITER %
CREATE TRIGGER PaymentStatusInvoice
BEFORE INSERT ON Invoice
FOR EACH ROW
BEGIN
	IF(NEW.amountPaid = 0) THEN
		SET NEW.paymentStatus = 'PENDING' ;
    END IF;
	IF(NEW.amountPaid > 0) THEN
		SET NEW.paymentStatus = 'PARTIAL';
	END IF;
	IF(NEW.amountPaid = NEW.totalPrice && NEW.totalPrice != 0) THEN
		SET NEW.paymentStatus = 'PAID' ;
    END IF;
	IF(NEW.amountPaid > NEW.totalPrice) THEN
		SET NEW.paymentStatus = 'INVALID';
	END IF;
END
%
DELIMITER ;

DROP TRIGGER IF EXISTS PaymentStatusUpdateInvoice;
DELIMITER %
CREATE TRIGGER PaymentStatusUpdateInvoice
BEFORE UPDATE ON Invoice
FOR EACH ROW
BEGIN
	IF(NEW.amountPaid = 0) THEN
		SET NEW.paymentStatus = 'PENDING' ;
    END IF;
	IF(NEW.amountPaid > 0) THEN
		SET NEW.paymentStatus = 'PARTIAL';
	END IF;
	IF(NEW.amountPaid = NEW.totalPrice && NEW.totalPrice != 0) THEN
		SET NEW.paymentStatus = 'PAID' ;
    END IF;
	IF(NEW.amountPaid > NEW.totalPrice) THEN
		SET NEW.paymentStatus = 'INVALID';
	END IF;
END
%
DELIMITER ;







