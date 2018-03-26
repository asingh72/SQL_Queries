select pu.* from employees e, customers c, products pr, purchases pu where c.name like'K%' and pr.original_price < 15 and e.telephone# like '888%' and c.cid=pu.cid and pr.pid=pu.pid and e.eid=pu.eid; 



select pu.pur#, pu.eid, pu.pid, pu.cid, pu.cid, pu.qty, to_char(ptime, 'YYYY-MM-DD') "ptime", pu.total_price 
from employees e, customers c, products pr, purchases pu where c.name like'K%' and pr.original_price < 15 and e.telephone# like '888%' and c.cid=pu.cid and pr.pid=pu.pid and e.eid=pu.eid; 





PUR# EID PID  CID         QTY PTIME     TOTAL_PRICE
