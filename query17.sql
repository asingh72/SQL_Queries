select pu1.pur#,((pr1.original_price * pu1.qty) - pu1.total_price) "saving" from purchases pu1, products pr1 
where ((pr1.original_price * pu1.qty) - pu1.total_price) like (select max((pr.original_price * pu.qty) - pu.total_price) "saving" from products pr, purchases pu  where pr.pid=pu.pid) 
and pr1.pid=pu1.pid ;
