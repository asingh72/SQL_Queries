
select cid , name from customers c where not exists
	(select * from products pr where pr.pid in
		(select pu.pid from purchases pu
		 where pu.cid='c005') and not exists
		 	(select * from purchases pu
		 	where c.cid=pu.cid and pr.pid=pu.pid));