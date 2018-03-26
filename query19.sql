 select * 
 from (select pu.cid, c.name, sum(pu.total_price) "total amount spent" from purchases pu, customers c where c.cid=pu.cid group by pu.cid, c.name order by sum(pu.total_price) desc) 
 where rownum <= 3;

