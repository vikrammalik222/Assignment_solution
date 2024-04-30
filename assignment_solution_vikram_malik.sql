-- Q1:Retrieve a list of customers who have made at least one purchase, along with their total spending.
select o.customerid,concat(firstname,' ',lastnane) as name , sum(totalamount) as Total_spending from customers c join orders o on c.customerid=o.customerid group by o.customerid;

-- Q2:Calculate the total revenue generated from sales in the year 2022.
select year(orderdate),sum(unitprice*quantity) as total_revenue_generated from orders o join orderdetails d on o.orderid=d.orderid join products p on d.productid=p.productid where year(orderdate)=2022;

-- Q3:Identify the top 5 products by revenue in descending order.
select productname, unitprice*quantity as revenue from orderdetails d join products p on d.productid=p.productid order by revenue desc limit 5;

-- Q4:Find the customer with the highest total spending and list their details
select name, total_spending ,dense_rank() over(order by total_spending desc) as r from (select o.customerid, concat(firstname,' ',lastname) as name , sum(totalamount) as total_spending from customers c join orders o on c.customerid=o.customerid group by o.customerid) t where r=1;

-- Q5: Determine the average order value (AOV) for each year between 2020 and 2022.
select year(orderdate),sum(unitprice*quantity)/count(o.orderid) as AOV from orders o join orderdetails d on o.orderid=d.orderid join products p on d.productid=p.productid where year(orderdate) between 2020 and 2022 group by year(orderdate);

-- Q6: Calculate the total number of products sold for each product category.
select productid,sum(quantity) as total_numbers_sold from orderdetails group by productid;

-- Q7: Identify the product with the highest quantity sold in each product category.
select p.productid,productname from products p join (select productid,max(quantity) as tq from orderdetails group by product_id) t on p.productid=t.productid



