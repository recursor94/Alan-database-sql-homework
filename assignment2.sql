select distinct city from Agents 
where aid in(
       select aid  from Orders
       where cid = 'c002'
);

select distinct pid from Orders 
where aid in (
      select aid from Orders
      where cid in
      	    (
		select cid from Customers
		where city = 'Kyoto'));