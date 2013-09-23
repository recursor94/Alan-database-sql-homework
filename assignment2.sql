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

select distinct cid, name from Customers
where cid in (
      select cid from Orders
      where pid = 'p01' or pid = 'p02');

select distinct pid from Orders
where cid in (
      select cid from Orders
      where aid = 'a03');

select name, discount from Customers
where cid in (
      select cid from Orders
      where aid in (
      	    select aid from Agents
	    where city = 'Dallas' or city = 'Duluth'));



select * from Customers
where not city = 'Dallas' and not city = 'Kyoto' and discount in (
      select discount from Customers  --better check to make sure we don't include the cities themselves in there.  Because we already know that they're equal to their own discounts
      where city = 'Dallas' or city = 'Kyoto');