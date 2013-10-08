--Get the cities of agents booking an order for customer c002. Use a subquery.(Ysame as homewqrk #2)
select distinct city from Agents 
where aid in(
       select aid  from Orders
       where cid = 'c002');


--Get the cities of agents booking an order for customer c002.  THis time use joins; no subqueries.
select city from Agents a
inner join Orders o
      on o.aid = a.aid and o.cid='c002';

--Get the pids of products ordered through an agent who makes at least one orde for a customer in KYoto.  Use subquerise.(same as hw2)
select distinct pid from Orders 
where aid in (
      select aid from Orders
      where cid in
      	    (
		select cid from Customers
		where city = 'Kyoto'));

--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.  Use joins this time; no subqueries.
select distinct o1.pid from Orders o
inner join customers c
      on c.cid = o.cid and c.city = 'Kyoto'
full join orders o1
     on o1.aid = o.aid
     where o.ordno is not null
     order by o1.pid;
---

--Get the names of customers who have never placed an order.  Use a subquery.
select distinct name from Customers
where not cid in (
      select cid from Orders
      ); 

--Get the names of customers who have never placed an order.  Use an outer join.

select distinct name from Customers c
left outer join Orders o
     on c.cid = o.cid
where o.cid is null;

--Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.
select distinct c.name, a.name from Customers c, Agents a, Orders o
where c.city = a.city and o.aid = a.aid and o.cid = c.cid;

--Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever placed an order with that agent.

select distinct c.name, a.name from Customers c, Agents a, Orders o
where c.city = a.city;

--Get the name and city of customers who live in a city where the least number of products are made

select avg(dollars) from Orders; --there to test function calls in sql.  I ultimately abandoned the idea.

select distinct c.name, c.city from Customers c
where c.city in (
      select city from Products
      group by city
      order by count(quantity)
      limit 1); --will only send the lowest city


--get the name and the city of customers who live in A city where the most number of products are made.
select distinct c.name, c.city from Customers c
where c.city in (
      select city from Products
      group by city
      order by count(quantity) desc
      limit 1);

--Get the name and city of customers who live in ANY city where the most number of products are made.

create view Cities as
select p.city, p.quantity from Products p
group by p.city, p.quantity
order by count(p.quantity);

select 

--How do I add the quantity of all of one city?


--list the products whose priceusd is above the average priceUSD
select * from Products
where priceusd > (select avg(priceusd) from products);

-- Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.
select c.name, o.pid, o.dollars
from orders o, customers c
where o.cid = c.cid
order by dollars desc;


-- Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs. 
select c.name, coalesce(sum(o.qty),0) as "total products ordered" from customers c
left outer join orders o
     on c.cid = o.cid
     group by c.name
     order by c.name;


-- Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars. 

select * from orders o, customers c, products p
where o.cid = c.cid and o.pid = p.pid 
and o.dollars != ( p.priceusd * o.qty * ((100 - c.discount) / 100)) 
and o.dollars is not null;

---- Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query.

update orders
set dollars = 9001
where ordno = 1020;