



select pr.pid, pr.name, max(pr.original_price * pr.discnt_rate) "discount amount" from products pr where   max(original_price * discnt_rate);



select * from (select pid, name, (original_price * discnt_rate) "discount amount"  from products 
order by (original_price * discnt_rate) desc) 
where rownum = 1;





