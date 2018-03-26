select pu.cid, sum(total_price) from purchases pu where sum(total_price) > ( select sum(pu1.total_price) from purchases pu1 where pu1.cid='c006' group by pu1.cid) group by pu.cid;
 
 
 select pu.pur# from purchases pu where (total_price) >= ( select sum(pu1.total_price) from purchases pu1 where pu1.cid='c006' group by pu1.cid);
 
 
 
 select pu1.cid, sum(pu1.total_price) from purchases pu1 where pu1.cid='c006' group by pu1.cid