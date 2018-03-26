select DISTINCT e.eid from employees e, customers c where SUBSTR(e.telephone#, 1, 3) in (select  SUBSTR(c.telephone#, 1, 3) "areacode" from customers) ORDER BY e.eid Asc;


