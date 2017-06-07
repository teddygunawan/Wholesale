INSERT INTO Distributor
	VALUES(10000001, 'Johnny', 'Jalan Tabuan Dayak', 'Kuching', 93400, 06184657823),
	(10000002, 'James Boyant', 'Jalan Raya', 'Singkawang', 79122, 06133445512),
	(10000003, 'Kim Non', 'Jalan Masyarakat Setempat', 'Kuching', 93010, 06135446519),
	(10000004, 'Jojo', 'Jalan Simpang Tiga', 'Kuching', 93350, 06133144512),
	(10000005, 'Kanna Minazawa', 'Jalan Jarendeng', 'Bengkayang', 75122, 06113745512),
	(10000006, 'Nguyen Jason', 'Jalan Simpang Tiga', 'Kuching', 93350, 06133115511),
	(10000007, 'Tan Cong Yen', 'Jalan Adi Sucipto', 'Pontianak', 78122, 06133443318),
	(10000008, 'Farhan Kurniawin', 'Jalan Raya', 'Singkawang', 79122, 06133445512),
	(10000009, 'Ivania Iloh', 'Jalan Adi Sucipto', 'Pontianak', 78122, 06134445552),
	(10000010, 'Melvin Sanjaya', 'Jalan Raya', 'Singkawang', 79122, 06133748562)
;

INSERT INTO WorkRole
	VALUES(101, 'Janitor', 3, 250),
	(102, 'Supervisor', 8, 1000),
	(103, 'Cashier', 8, 600),
	(104, 'Laborer', 8, 500),
	(105, 'Goods Manager', 3, 300),
	(106, 'Goods Refiller', 2, 250),
	(107, 'Goods Transporter', 2, 400),
	(108, 'Guards', 8, 750),
	(109, 'Customer Service', 8, 500),
	(110, 'Cleaner', 3, 200)
;

INSERT INTO Employee
	VALUES(10001001, 101, 'Christable Banar', 'Jalan Tabuan Dayak', '06134542457'),
	(10001002, 102, 'Nana Miri', 'Jalan Tabuan Dayak', '06134543263'),
	(10001003, 103, 'John Tempora', 'Jalan Tabuan Dayak', '06134547453'),
	(10001004, 104, 'Masturian Jook', 'Jalan Simpang Tiga', '06134548645'),
	(10001005, 105, 'Maya', 'Jalan Simpang Tiga', '06145322457'),
	(10001006, 106, 'Tommy Boi', 'Jalan Simpang Tiga', '06112622457'),
	(10001007, 107, 'Urai Ahmad', 'Jalan Ahmad Yani', '06134545522'),
	(10001008, 108, 'Lidya Venty', 'Jalan Ahmad Yani', '06193542457'),
	(10001009, 109, 'Donald Richard', 'Jalan Ahmad Yani', '06155952457'),
	(10001010, 110, 'Lordo Ringy', 'Jalan Ahmad Yani', '06104232457')
;

INSERT INTO Salary
	VALUES(10001001, 101, 600, 0, '2017-2-01'),
	(10001002, 102, 2000, 0, '2017-2-01'),
	(10001003, 103, 1500, 0, '2017-2-01'),
	(10001004, 104, 1250, 0, '2017-2-01'),
	(10001005, 105, 1500, 0, '2017-2-01'),
	(10001006, 106, 1300, 0, '2017-2-01'),
	(10001007, 107, 800, 0, '2017-2-01'),
	(10001008, 108, 1600, 0, '2017-2-01'),
	(10001009, 109, 1000, 0, '2017-2-01'),
	(10001010, 110, 700, 0, '2017-2-01')
;
INSERT INTO Retailer()
	VALUES(10003001, 'James Bind', 'Jalan Padungan', 3, '06123456123'),
	(10003002, 'Leeroy Kevin', 'Jalan Petanal', 2, '06123234122'),
	(10003003, 'Megumin', 'Jalan Abell', 3, '06123172325'),
	(10003004, 'Okabe Rintarou', 'Jalan Ang Cheng Ho', 4, '06123173125'),
	(10003005, 'Makise Kurisu', 'Jalan Chong Ted Tsiung', 5, '06123223122'),
	(10003006, 'Kuristina', 'Jalan Datuk Wee Kheng Chiang', 6, '06123536163'),
	(10003007, 'Mafuyu', 'Jalan Sekama', 4, '06123418353'),
	(10003008, 'John Carter', 'Jalan Song', 7, '06123438461'),
	(10003009, 'Subaru', 'Jalan Tunku Abdul Rahman', 5, '06123456129'),
	(10003010, 'Rem', 'Jalan Main Bazaar', 10, '06123422223')
;
INSERT INTO Customer
	VALUES(10002001, 'Nadya Jul'),
	(10002002, 'Marga Magdalenny'),
	(10002003, 'Kelvin Adityo'),
	(10002004, 'Edwin Jon'),
	(10002005, 'Hilton Karasi'),
	(10002006, 'Tasnim Rahmon'),
	(10002007, 'Arun Prasman'),
	(10002008, 'Widiardys'),
	(10002009, 'Jezzy Kim'),
	(10002010, 'Kim Non Non')
;

INSERT INTO Warehouse
	VALUES(01, 'Milk Storage', 'Jalan Batu Kawa'),
	(02, 'Cigarette Storage', 'Jalan Batu Kawa'),
	(03, 'Snack Storage', 'Jalan Batu Kawa'),
	(04, 'Noodles Storage', 'Jalan Lorong Rock'),
	(05, 'Alcohol Storage', 'Jalan Lorong Rock'),
	(06, 'Miscellaneous Storage', 'Jalan Lorong Rock'),
	(07, 'Drink Storage', 'Jalan Tabuan Dayak'),
	(08, 'Spices Storage', 'Jalan Tabuan Dayak'),
	(09, 'Gas Storage', 'Jalan Tabuan Dayak'),
	(10, 'Tools Storage', 'Jalan Tabuan Dayak')
;

INSERT INTO GoodsCategory
	VALUES(101, 'Dairy', 'All types of milk'),
	(102, 'Cigarette', 'All types of cigars'),
	(103, 'Noodles', 'Instant noodle and handmade noodle'),
	(104, 'Detergent', 'Cleaning property'),
	(105, 'Medicine', 'All types of curing medicine'),
	(106, 'Candy', 'Every sweets'),
	(107, 'Sauce', 'Soy sauce, ketchup and vinegar'),
	(108, 'Vegetable', 'Including tomato'),
	(109, 'Fruit', 'Excluding Carrot'),
	(110, 'Spices', 'Seasoning used in cooking')
;
INSERT INTO Goods
	VALUES(1001, 101, 07, 'Dancow', 200, 12),
	(1002, 103, 06, 'Maggie Kari Ayam', 200, 7),
	(1003, 110, 01, 'Masako', 200, 7),
	(1004, 106, 09, 'Pendekar Biru', 200, 5),
	(1005, 105, 09, 'Panadol', 200, 10),
	(1006, 107, 09, 'Kecap Bango', 200, 12),
	(1007, 101, 07, 'Good Day', 200, 8),
	(1008, 102, 08, 'Marlboro', 200, 17),
	(1009, 102, 08, 'Surya', 200, 15),
	(1010, 102, 08, 'L.A', 200, 11)
;
INSERT INTO GoodsOrderInvoice (invoiceNumber, distributorID, amountPaid, paymentStatus, deliveryDate) 
VALUES(100001, 10000010, 0, 'PENDING', '2017-06-04'),
	(100002, 10000009, 0, 'PENDING', '2017-06-03'),
	(100003, 10000008, 0, 'PENDING', '2017-06-30'),
	(100004, 10000007, 0, 'PENDING', '2017-06-17'),
	(100005, 10000006, 0, 'PENDING', '2017-06-10'),
	(100006, 10000001, 0, 'PENDING', '2017-06-25'),
	(100007, 10000002, 0, 'PENDING', '2017-06-18'),
	(100008, 10000003, 0, 'PENDING', '2017-06-13'),
	(100009, 10000004, 0, 'PENDING', '2017-06-30'),
	(100010, 10000005, 0, 'PENDING', '2017-06-01')
;

INSERT INTO GoodsInvoiceLine (invoiceNumber, goodsID, quotedPrice, quantity) 
VALUES(100001, 1001, 10, 100),
	(100002, 1002, 5, 200),
	(100003, 1003, 5, 70),
	(100004, 1004, 3, 300),
	(100005, 1005, 7, 100),
	(100006, 1006, 10, 50),
	(100007, 1007, 6, 125),
	(100008, 1008, 15, 300),
	(100009, 1009, 12, 100),
	(100010, 1010, 9, 200)
;

INSERT INTO Invoice (invoiceNumber, retailerID, empID, totalPrice, amountPaid, paymentStatus, orderDate) 
VALUES(100001, 10003001, 10001003, 0, 0, 'PENDING', '2017-06-29'),
	(100002, 10003002, 10001003, 0, 0, 'PENDING', '2017-06-02'),
	(100003, 10003003, 10001003, 0, 0, 'PENDING', '2017-06-24'),
	(100004, 10003004, 10001003, 0, 0, 'PENDING', '2017-06-27'),
	(100005, 10003005, 10001003, 0, 0, 'PENDING', '2017-06-10'),
	(100006, 10003006, 10001003, 0, 0, 'PENDING', '2017-06-20'),
	(100007, 10003007, 10001003, 0, 0, 'PENDING', '2017-06-14'),
	(100008, 10003008, 10001003, 0, 0, 'PENDING', '2017-06-01'),
	(100009, 10003009, 10001003, 0, 0, 'PENDING', '2017-06-17'),
	(100010, 10003010, 10001003, 0, 0, 'PENDING', '2017-06-30')
;

INSERT INTO InvoiceLine (invoiceNumber, goodsID, quotedPrice, quantity) 
VALUES(100001, 1001, 12, 3),
	(100002, 1002, 7, 5),
	(100003, 1003, 7, 2),
	(100004, 1004, 5, 5),
	(100005, 1005, 10, 3),
	(100006, 1006, 12, 2),
	(100007, 1007, 8, 1),
	(100008, 1008, 17, 1),
	(100009, 1009, 15, 2),
	(100010, 1010, 11, 3)
;

INSERT INTO Orders (orderID, customerID, empID, totalPrice, orderDate) 
VALUES(100001, 10002001, 10001003, 0, '2017-06-01'),
	(100002, 10002002, 10001003, 0, '2017-06-02'),
	(100003, 10002003, 10001003, 0, '2017-06-03'),
	(100004, 10002004, 10001003, 0, '2017-06-04'),
	(100005, 10002005, 10001003, 0, '2017-06-05'),
	(100006, 10002006, 10001003, 0, '2017-06-06'),
	(100007, 10002007, 10001003, 0, '2017-06-07'),
	(100008, 10002008, 10001003, 0, '2017-06-08'),
	(100009, 10002009, 10001003, 0, '2017-06-09'),
	(100010, 10002010, 10001003, 0, '2017-06-10')
;

INSERT INTO OrderDetails (orderID, goodsID, quotedPrice, quantity) 
VALUES(100001, 1001, 12, 3),
	(100002, 1002, 7, 5),
	(100003, 1003, 7, 2),
	(100004, 1004, 5, 5),
	(100005, 1005, 10, 3),
	(100006, 1006, 12, 2),
	(100007, 1007, 8, 1),
	(100008, 1008, 17, 1),
	(100009, 1009, 15, 2),
	(100010, 1010, 11, 3)
;
	
	