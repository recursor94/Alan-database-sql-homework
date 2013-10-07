--Get the cities of agents booking an order for customer c002.  THis time use joins; no subqueries.
select city from Agents a
inner join Orders o
      on o.aid = a.aid and o.cid='c002';

--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.  Use joins this time; no subqueries.
select distinct pid from Products p
inner join Orders o
      on 
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

select avg(dollars) from Orders;

select distinct c.name, c.city from Customers c
where c.city in (
      select city from products
      group by city
      order by count(quantity)
      limit 1); --will only send the lowest city