select c.name from customers c, products pr, purchases pu where c.visits_made > 1 and to_char(last_visit_date, 'MM/DD/YYYY') = to_char(ptime, 'MM/DD/YYYY')  and (pr.original_price * (1 - pr.discnt_rate)) > '100' and c.cid=pu.cid and pr.pid=pu.pid;


