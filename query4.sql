select  pr.pid, name from products pr, purchases pu  where (pu.ptime like '%AUG-17' or pu.ptime like '%SEP-17') and (original_price * (1 - discnt_rate)) < '10' and pr.pid=pu.pid;









