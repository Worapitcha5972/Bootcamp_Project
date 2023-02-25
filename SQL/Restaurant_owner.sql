CREATE TABLE menu (
  menuID INT,
  menuName text,
  menuPrice INT,
	PRIMARY KEY (menuID)
);

INSERT INTO menu values
(1,'Padthai',65)
,(2,'Som tum',45)
,(3,'Tom kha gai',60)
,(4,'Chicken fried rice',55)
,(5,'Yum',75)
,(6,'Kao mun gai',50);

CREATE TABLE customer (
  custID INT,
  FirstName text,
  LastName text,
	custPonit INT,
	PRIMARY KEY (custID)
);

INSERT INTO customer values
(1,'Taylor','Lau',510)
,(2,'John','Mayson',355)
,(3,'Anya','Joy',670)
,(4,'Bradly','Kyle',210)
,(5, 'Harry','Tompsons',150);

CREATE TABLE payment (
  paymentID INT,
  paymentType text,
	PRIMARY KEY (paymentID)
);

INSERT INTO payment values
(1,'CASH')
,(2,'CREDITCARD')
,(3,'QR CODE')
,(4,'RABBIT LINE PAY')
,(5,'PAYPAL');

CREATE TABLE staff (
  staffID INT,
  firstname text,
  lastname text,
  	PRIMARY KEY (staffID)
 );

INSERT INTO staff VALUES
(1,'Toko','Ari')
,(2,'Patty','Matung')
,(3,'Maria','Jung')
,(4,'Rachel','Green');

CREATE TABLE orders (
   orderID INT,
   orderDate date,
   menuID INT,
   custID INT,
   paymentID INT,
   staffID INT,
	PRIMARY KEY (orderID)
	,FOREIGN KEY (menuID) REFERENCES menu(menuID)
	,FOREIGN KEY (custID) REFERENCES customer(custID)
	,FOREIGN KEY (paymentID) REFERENCES payment(paymentID)
	,FOREIGN KEY (paymentID) REFERENCES staff (staffID)
);

INSERT INTO orders values
(1,'2022-08-22',1,3,1,4)
,(2,'2022-08-23',2,5,2,3)
,(3,'2022-08-24',2,3,3,4)
,(4,'2022-08-24',5,1,1,1)
,(5,'2022-09-25',2,3,3,2)
,(6,'2022-09-25',4,4,4,1)
,(7,'2022-09-26',3,2,2,4)
,(8,'2022-10-26',3,1,1,3)
,(9,'2022-10-24',2,3,3,4)
,(10,'2022-11-25',3,4,4,1)
,(11,'2022-11-24',4,1,1,1)
,(12,'2022-11-22',1,3,1,4);

-- mode type
.mode markdown
.header on
  
-- Top 3 Best seller
SELECT 
	menuname as Menu,
    COUNT(orderid) as total_order,
    SUM(menuprice) ||' ' || 'THB' as total_price
from orders JOIN menu
on orders.menuid = menu.menuid
GROUP by menuname
order by total_order DESC
LIMIT 3;

-- Monthly Sale
SELECT 
  STRFTIME ('%m', orders.orderdate) AS month,
  SUM(menuprice) ||' ' || 'THB' AS total_sale
FROM orders
JOIN menu
ON orders.menuid = menu.menuid
GROUP BY month;

-- Rachel G.total sale by month
SELECT
	STRFTIME('%m', orders.orderdate) as month,
    COUNT(orderid) as totalOrder,
    SUM(menuprice) ||' ' || 'THB' As totalSale
from orders JOIN menu
on orders.menuid = menu.menuid
where staffid = 4
group by month;

-- Top 3 spender Subquery / WITH (CTE)
WITH price As (
SELECT 
	orderid,
  	custid,
    menuprice 
FROM orders JOIN menu
on orders.menuid = menu.menuid)
    
SELECT
	firstname || " " || lastname as customer_name,
    COUNT(orderid) AS total_order,
    SUM(menuprice) AS total_spend,
    custponit AS point
FROM price JOIN customer
on price.custid = customer.custid
GROUP by customer_name
order by total_spend desc
LIMIT 3;

