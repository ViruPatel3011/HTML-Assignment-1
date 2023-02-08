
select * from Employees
select * from [Order Details]
select * from Orders
select * from Products
select * from Customers

-- Query 1

create procedure sp_ValidateFreight
    -- inputted customer
    @CustomerID nvarchar(5),
    -- returned average freight
    @AverageFreight money output
as
begin
   select @AverageFreight = AVG(Freight) 
   from Orders
   where CustomerID = @CustomerID
end
go

Declare @AvgFreight int;
execute sp_ValidateFreight VINET, @AvgFreight output;
Print @AvgFreight

Create trigger tr_VerifyFreightForInsertdata
on Orders
Instead of insert
as
begin
	Declare @AvgFreightOfOrders money
	Declare @CustID nchar(5)
	Declare @Freight money
	Select @CustId=CustomerID from inserted
	Select @Freight=Freight from inserted
	-- execute stored procedure
	exec sp_ValidateFreight @CustID,
		@AverageFreight = @AvgFreightOfOrders output
	-- check the freight
		if @AvgFreightOfOrders is not null 
			and @AvgFreightOfOrders < @Freight 
		begin
			Raiserror('Invalid data as Freight value exceeds the average freight value',16,1)
			return
		end
end

Create trigger tr_VerifyFreightForUpdate
on Orders
Instead of update
as
begin
	Declare @AvgFreightOfOrders money
	Declare @CustID nchar(5)
	Declare @Freight money
	Select @CustId=CustomerID from inserted
	Select @Freight=Freight from inserted
	-- execute stored procedure
	exec sp_ValidateFreight @CustID,
		@AverageFreight = @AvgFreightOfOrders output
	-- check the freight
		if @AvgFreightOfOrders is not null 
			and @AvgFreightOfOrders < @Freight 
		begin
			Raiserror('Invalid data as Freight value exceeds the average freight value',16,1)
			return
		end
end

Insert into Orders values('VINET',null,null,null,null,null,5,null,null,null,null,null,null);



--Query 2
CREATE PROC spEmployeeSalebyCountry
AS
BEGIN
  select Employees.FirstName,Employees.LastName,sum([Order Subtotals].Subtotal) as TotalSale,
  Employees.Country
  from Employees
  join
  Orders
  on Employees.EmployeeID=Orders.EmployeeID
  join
  [Order Subtotals]
  on
  [Order Subtotals].OrderID=Orders.OrderID
  group by Employees.FirstName,Employees.LastName,Employees.Country
END

EXEC spEmployeeSalebyCountry


--Query 3
CREATE PROC spSalesByYear
AS
BEGIN
  select YEAR(Orders.OrderDate) as Year, sum([Order Subtotals].Subtotal) as TotalSale
  from 
  [Order Subtotals]
  join 
  Orders
  on
  [Order Subtotals].OrderID=Orders.OrderID
  GROUP BY YEAR(Orders.OrderDate)

END

EXEC spSalesByYear


--Query 4

CREATE PROC spSalesByCategory
as 
begin
	select CategoryName, sum(ProductSales) as TotalSale from [Sales by Category] group by CategoryName
end


EXEC spSalesByCategory

-- Query 5

CREATE PROC spTop10ExpensiveProducts
AS
BEGIN
	select top(10) ProductName, UnitPrice from Products order by UnitPrice DESC
END

EXEC spTop10ExpensiveProducts



-- Query 6

CREATE PROC spInsertOrderDetails
@OrderID int, @ProductID int, @UnitPrice money,@Quantity smallint,@Discount real
AS
BEGIN
	insert into [Order Details] values (@OrderID,@ProductID,@UnitPrice,@Quantity,@Discount)
END

select * from [Order Details]

EXEC spInsertOrderDetails 10384,21,65.20,10,0.1


--Query 7
CREATE PROC spUpdateOrderDetails
@ID int,@UnitPrice money,@Quantity smallint,@Discount real
AS
BEGIN
	update [Order Details] SET UnitPrice=@UnitPrice, Quantity=@Quantity,
	Discount=@Discount where OrderID=@ID
END

select * from [Order Details]

spUpdateOrderDetails 10550,23.00,9,0.15