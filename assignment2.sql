select distinct city from Agents 
where aid in(
       select aid  from Orders
       where cid = 'c002');

select distinct pid from Orders 
where aid in (
      select aid from Orders
      where cid in
      	    (
		select cid from Customers
		where city = 'Kyoto'));

select distinct cid, name from Customers
where cid not in (
      select distinct cid from orders
      where aid = 'a03');