--List all data for all customers

select * from Customers;


-- List the name and city of agents named smith

select name, city from Agents
where name = 'Smith';

--List pid, name, and quantity of products costing more than us 1.25

select pid, name,  quantity from Products
where priceusd > 1.25;

--List the ordno and aid of all orders
select ordno, aid from Orders;

--List the names and cities of customers not in Dallas.

select name, city from Customers
where city != 'Dallas';

--List the names of agents in New York or Newark

select name from Agents
where city = 'New York' or city = 'Newark';

--List all data for products not in New York or Newark that cost 1 us dollar or less

select * from Products
where city != 'Newark' and city != 'New York'
and priceusd <= 1.00; --different type here hence why it's on a different line

--List all data for orders in January or March.

select * from Orders
where mon = cast ('jan' as text) or mon = cast('mar' as text);

-- List all data for orders in February less than US 100

select * from Orders
where mon = cast ('feb' as text)
and dollars < 100.00;

--That would probably work if there were any entries that were actually less than 100 dollars.

--List all orders from the customer whose cid is coo5

select * from Orders
where cid = 'c005'

--nothing again?  Is this a trick question? hmmm....