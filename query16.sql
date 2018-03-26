select products.pid, products.name, sum(qty) "total quantity sold" from products, purchases where products.pid=(select pu.pid from purchases pu where qty like (select max(qty) from purchases)) and products.pid=purchases.pid group by products.name, products.pid; 



select pr.pid, pr.name, sum(pu.qty) "total quantity sold" from purchases pu, products pr where pr.pid=pu.pid group by pr.pid, pr.name order by pr.pid asc;