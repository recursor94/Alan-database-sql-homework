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
left outer join orders o
     on c.cid = o.cid
where o.cid is null;