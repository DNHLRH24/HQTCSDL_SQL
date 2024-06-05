--6.1-- 
select sup.SupplierID, suppliername, sup.Address, COUNT(p.ProductID) AS SoLuongMatHang
from suppliers as sup
join products p on p.SupplierID = sup.SupplierID
group by sup.SupplierID, suppliername, sup.Address
--6.2--
select categoryname, count(p.productid) as somathang
from categories as ca 
join products p on ca.CategoryID = p.CategoryID
group by categoryname
order by somathang DESC;

--6.3--
SELECT customername, count(o.orderid) as sodonhang
from orders as o
join customers c on c.CustomerID= o.CustomerID
group by CustomerName
order by sodonhang DESC;
--6.4
SELECT Shippername , count(o.orderid) as sodonhang
from orders as o
join Shippers s on s.ShipperID= o.ShipperID
group by ShipperName
order by sodonhang DESC;

--6.5
select s.country, count(s.supplierid) soluongnhacungcap
from Suppliers as s
group by s.country
order by soluongnhacungcap DESC;

--6.7
SELECT c.country , count(o.orderid) as sodonhang
from orders as o
join Customers c on c.CustomerID= o.CustomerID
group by c.country
order by sodonhang DESC;

--6.8
select e.FirstName,e.LastName ,count(o.orderid) as sodonhang
from Orders as o
join Employees e on e.EmployeeID=o.EmployeeID
where MONTH(o.OrderDate) = 8
    AND YEAR(o.OrderDate) = 2016
group by e.FirstName,e.LastName
order by sodonhang DESC;
--6.9
select e.FirstName,e.LastName ,count(o.orderid) as sodonhang
from Orders as o
join Employees e on e.EmployeeID=o.EmployeeID
where MONTH(o.OrderDate) = 8
    AND YEAR(o.OrderDate) = 2016
group by e.FirstName,e.LastName
order by sodonhang DESC;