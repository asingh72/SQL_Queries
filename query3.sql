
select name, telephone#  from customers c , purchases p where (to_char(ptime, 'Month') like 'October%') and (to_char(ptime, 'YYYY') = '2017') and total_price > '100' and c.cid = p.cid;
