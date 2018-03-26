select c.cid from customers c where c.cid 
in (select pu.cid from purchases pu, products pr where pu.ptime like '%OCT-17' and pr.original_price > '200' and pr.pid=pu.pid);

select pu.cid from purchases pu, products pr where pu.ptime like '%OCT-17' and pr.original_price > '200' and pr.pid=pu.pid;


