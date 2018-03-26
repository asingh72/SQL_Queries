select c.name, c.telephone# from customers c, purchases pu where c.telephone# like '666%' and pu.ptime like '%OCT-17' and c.cid=pu.cid;







