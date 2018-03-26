(a) select e.name from employees e where e.name not in (select e.name from employees e, purchases pu, products pr where pr.original_price >= 200 and e.eid=pu.eid and pr.pid=pu.pid); 

(b) select e1.name from employees e1 where not exists (select e.name from employees e, purchases pu, products pr where pr.original_price >= 200 and e.eid=pu.eid and pr.pid=pu.pid and e.eid=e1.eid); 


