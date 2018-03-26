select e.eid , e.name from employees e, purchases pu , products pr where pu.


select e.eid , e.name from employees e where e.eid in (select pu.eid from purchases pu , products pr where (pr.name like 'camera' or pr.name like 'chair') and pr.pid=pu.pid);



