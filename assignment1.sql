--List all data for all customers

select * from customers;


-- List the name and city of agents named smith

select name, city from Agents
where name = 'Smith'

--List pid, name, and quantity of products costing more than us 1.25

select pid, name,  quantity from Products
where priceusd > 1.25

--List the ordno and aid of all orders
select ordno, aid from orders