select to_char(ptime, 'YYYY/MM') "Month", sum(total_price) "Total Sale" from purchases group by to_char(ptime, 'YYYY/MM');



