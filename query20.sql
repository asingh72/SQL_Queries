select pu.pid, pr.name, count(pu.pid) from purchases pu, products pr where pu.ptime like '%OCT-17' and pr.pid=pu.pid group by pu.pid, pr.name;




select pu.pid, pr.name, count(pu.pid) from purchases pu, products pr where pu.ptime like '%OCT-17' and pr.pid=pu.pid group by pu.pid, pr.name;








select * from purchases full outer join products on purchases.pid=products.pid;
