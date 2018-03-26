select c.name, max(pu.total_price) "highest total price" from customers c, purchases pu where c.cid=pu.cid group by c.name, c.cid;


