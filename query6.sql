SET LINESIZE 170 select pu.pur#, pr.name "product name", to_char(pu.ptime, 'Month DD, YYYY Day HH:MM:SS') "ptime", ((pr.original_price * pu.qty) - pu.total_price) "saving" from products pr, purchases pu where pr.pid=pu.pid;