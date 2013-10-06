--Get the cities of agents booking an order for customer c002.  THis time use joins; no subqueries.
select city from Agents a
inner join Orders o
      on o.aid = a.aid and o.cid='c002';

--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto.  Use joins this time; no subqueries.
select distinct pid from Products p
inner join Orders o
      on 
---

