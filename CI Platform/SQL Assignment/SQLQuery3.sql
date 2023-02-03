CREATE TABLE Products(

ProductID  int ,
ProductName varchar(50),
SupplierID int,
CategoryID int,
QuantityPerUnit varchar(50),
UnitPrice  Decimal,
UnitsInStock int, 
UnitsOnOrder int,
ReorderLevel int,
Discontinued BIT

)

INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (1,'chai',1,1,'10 boxes x 20 bags',18.0000,39,0,10,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (2,'chang',1,1,'24 - 12 oz bottles',19.0000,17,40,25,1);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (3,'Aniseed Syrup  ',1,2,'12 - 550 ml bottles  ',10.0000,13,70,25,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (4,'Chef Anton"s Cajun Seasoning ',2,2,'48 - 6 oz jars',22.0000,53,0,0,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (5,'Chef Anton"s Gumbo Mix  ',2,2,'36 boxes',21.3500,0,0,0,1);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (6,'Grandma"s Boysenberry Spread ',3,2,' 12 - 8 oz jars ',25.0000,120,0,25,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (7,'Uncle Bob"s Organic Dried Pears ',3,7,'12 - 1 lb pkgs.',30.0000,15,0,10,1);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (8,'Northwoods Cranberry Sauce ',3,2,'12 - 12 oz jars',40.0000,6,0,0,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (9,'Mishi Kobe Niku   ',4,6,'18 - 500 g pkgs.',97.0000,29,0,0,1);

INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (10,'Ikura',4,8,'12 - 200 ml jars ',31.0000,31,0,0,0);

INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (11,' Queso Cabrales',5,4,'1 kg pkg.',21.0000,22,30,30,1);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (12,'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38.0000,86,0,0,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (13,'Konbu',6,8,'2 kg box ',6.0000,24,0,5,1);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (14,'Tofu',6,7,'40 - 100 g pkgs.',23.2500,35,0,0,0);


INSERT INTO Products(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES (15,'Genen Shouyu ',6,2,'24 - 250 ml bottles ',15.5000,39,0,5,1);




select * from Products

/*Query 1- Write a query to get a Product list (id, name, unit price) where current products cost
less than $20.*/
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE ((UnitPrice)<20)
ORDER BY UnitPrice DESC;

/*Query 2-Write a query to get Product list (id, name, unit price) where products cost between
$15 and $25*/
SELECT ProductID,ProductName, UnitPrice FROM Products
WHERE UnitPrice>15 AND UnitPrice<25
ORDER BY Products.UnitPrice DESC;



/*Query 3-Write a query to get Product list (name, unit price) of above average price.*/
SELECT ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
ORDER BY UnitPrice;


/*Query 4-Write a query to get Product list (name, unit price) of ten most expensive products*/
SELECT TOP 10 ProductName, UnitPrice FROM Products 
ORDER BY UnitPrice DESC



/*Query 5-Write a query to count current and discontinued products*/
SELECT Count(ProductName) FROM Products
GROUP BY Discontinued;



/*Query 6-Write a query to get Product list (name, units on order , units in stock) of stock is less
than the quantity on order*/
SELECT ProductName,  UnitsOnOrder , UnitsInStock FROM Products
WHERE (UnitsInStock<UnitsOnOrder);

