--Get the cities of agents booking an order for customer c002.  THis time use joins; no subqueries.
select city from Agents a
inner join Orders o
      on o.aid = a.aid and o.cid='c002';