
##Command to create and populate tables 

drop table purchases;
drop table employees;
drop table customers;
drop table products;

create table employees
(eid char(3) primary key,
name varchar2(15),
telephone# char(12),
email varchar2(20));

create table customers
(cid char(4) primary key,
name varchar2(15),
telephone# char(12),
visits_made number(4) check (visits_made >= 1),
last_visit_date date);

create table products
(pid char(4) primary key,
name varchar2(15),
qoh number(5),
qoh_threshold number(4),
original_price number(6,2),
discnt_rate number(3,2));

create table purchases
(pur# number(6) primary key,
eid char(3) references employees(eid),
pid char(4) references products(pid),
cid char(4) references customers(cid),
qty number(5),
ptime date,
total_price number(7,2));

insert into employees values ('e01', 'David', '666-555-1234', 'david@rb.com');
insert into employees values ('e02', 'Peter', '777-555-2341', 'peter@rb.com');
insert into employees values ('e03', 'Susan', '888-555-3412', 'susan@rb.com');
insert into employees values ('e04', 'Anne', '666-555-4123', 'anne@rb.com');
insert into employees values ('e05', 'Mike', '444-555-4231', 'mike@rb.com');

insert into customers values ('c001', 'Kathy', '666-555-4567', 3, '12-OCT-17');
insert into customers values ('c002', 'John', '888-555-7456', 1, '08-OCT-17');
insert into customers values ('c003', 'Chris', '666-555-6745', 3, '18-SEP-17');
insert into customers values ('c004', 'Mike', '999-555-5674', 1, '15-OCT-17');
insert into customers values ('c005', 'Mike', '777-555-4657', 2, '30-AUG-17');
insert into customers values ('c006', 'Connie', '777-555-7654', 2, '16-OCT-17');
insert into customers values ('c007', 'Katie', '888-555-6574', 1, '12-OCT-17');
insert into customers values ('c008', 'Joe', '666-555-5746', 1, '14-OCT-17');

insert into products values ('p001', 'stapler', 60, 20, 9.99, 0.1);
insert into products values ('p002', 'TV', 6, 5, 249, 0.15);
insert into products values ('p003', 'camera', 20, 5, 148, 0.2);
insert into products values ('p004', 'pencil', 100, 10, 0.99, 0.0);
insert into products values ('p005', 'chair', 10, 8, 12.98, 0.3);
insert into products values ('p006', 'lamp', 10, 6, 19.95, 0.1);
insert into products values ('p007', 'tablet', 50, 10, 149, 0.2);
insert into products values ('p008', 'computer', 5, 3, 499, 0.3);
insert into products values ('p009', 'powerbank', 20, 5, 49.95, 0.1);

insert into purchases values (100001, 'e01', 'p002', 'c001', 1, to_date('12-AUG-2017 10:34:30', 'DD-MON-YYYY HH24:MI:SS'), 211.65);
insert into purchases values (100002, 'e01', 'p003', 'c001', 1, to_date('20-SEP-2017 11:23:36', 'DD-MON-YYYY HH24:MI:SS'), 118.40);
insert into purchases values (100003, 'e02', 'p004', 'c002', 5, to_date('08-OCT-2017 09:30:50', 'DD-MON-YYYY HH24:MI:SS'), 4.95);
insert into purchases values (100004, 'e01', 'p005', 'c003', 2, to_date('23-AUG-2017 16:23:35', 'DD-MON-YYYY HH24:MI:SS'), 18.17);
insert into purchases values (100005, 'e04', 'p007', 'c004', 1, to_date('15-OCT-2017 13:38:55', 'DD-MON-YYYY HH24:MI:SS'), 119.20);
insert into purchases values (100006, 'e03', 'p008', 'c001', 1, to_date('12-OCT-2017 15:22:10', 'DD-MON-YYYY HH24:MI:SS'), 349.30);
insert into purchases values (100007, 'e03', 'p006', 'c003', 2, to_date('10-SEP-2017 17:12:20', 'DD-MON-YYYY HH24:MI:SS'), 35.91);
insert into purchases values (100008, 'e03', 'p006', 'c005', 1, to_date('16-AUG-2017 12:22:15', 'DD-MON-YYYY HH24:MI:SS'), 17.96);
insert into purchases values (100009, 'e03', 'p001', 'c007', 1, to_date('12-OCT-2017 14:44:23', 'DD-MON-YYYY HH24:MI:SS'), 8.99);
insert into purchases values (100010, 'e04', 'p002', 'c006', 1, to_date('19-SEP-2017 17:32:37', 'DD-MON-YYYY HH24:MI:SS'), 211.65);
insert into purchases values (100011, 'e02', 'p004', 'c006', 10, to_date('16-OCT-2017 16:54:40', 'DD-MON-YYYY HH24:MI:SS'), 9.90);
insert into purchases values (100012, 'e02', 'p008', 'c003', 2, to_date('18-SEP-2017 15:56:38', 'DD-MON-YYYY HH24:MI:SS'), 698.60);
insert into purchases values (100013, 'e04', 'p006', 'c005', 2, to_date('30-AUG-2017 10:38:25', 'DD-MON-YYYY HH24:MI:SS'), 35.91);
insert into purchases values (100014, 'e03', 'p009', 'c008', 3, to_date('14-OCT-2017 10:54:06', 'DD-MON-YYYY HH24:MI:SS'), 134.84);

-----------------------------------------------------------------------------------------------------------------------------------------------
##Output

SQL> start query1
SQL> select pid, name from products where discnt_rate > 0.1 and (qoh-10) >= qoh_threshold;

PID  NAME                                                                       
---- ---------------                                                            
p003 camera                                                                     
p007 tablet                                                                     

SQL> start query2
SQL> select c.name, c.telephone# from customers c, purchases pu where c.telephone# like '666%' and pu.ptime like '%OCT-17' and c.cid=pu.cid;

NAME            TELEPHONE#                                                      
--------------- ------------                                                    
Kathy           666-555-4567                                                    
Joe             666-555-5746                                                    

SQL> start query3
SQL> select name, telephone#  from customers c , purchases p where (to_char(ptime, 'Month') like 'October%') and (to_char(ptime, 'YYYY') = '2017') and total_price > '100' and c.cid = p.cid;

NAME            TELEPHONE#                                                      
--------------- ------------                                                    
Kathy           666-555-4567                                                    
Mike            999-555-5674                                                    
Joe             666-555-5746                                                    

SQL> start query4
SQL> select  pr.pid, name from products pr, purchases pu  where (pu.ptime like '%AUG-17' or pu.ptime like '%SEP-17') and (original_price * (1 - discnt_rate)) < '10' and pr.pid=pu.pid;

PID  NAME                                                                       
---- ---------------                                                            
p005 chair                                                                      

SQL> start query5
SQL> select pu.* from employees e, customers c, products pr, purchases pu where c.name like'K%' and pr.original_price < 15 and e.telephone# like '888%' and c.cid=pu.cid and pr.pid=pu.pid and e.eid=pu.eid;

      PUR# EID PID  CID         QTY PTIME     TOTAL_PRICE                       
---------- --- ---- ---- ---------- --------- -----------                       
    100009 e03 p001 c007          1 12-OCT-17        8.99                       

SQL> start query6
SQL> SET LINESIZE 170
SQL> select pu.pur#, pr.name "product name", to_char(pu.ptime, 'Month DD, YYYY Day HH:MM:SS') "ptime", ((pr.original_price * pu.qty) - pu.total_price) "saving" from products pr, purchases pu where pr.pid=pu.pid;

      PUR# product name    ptime                                                                                           saving                                         
---------- --------------- ------------------------------------------------------------------------------------------- ----------                                         
    100009 stapler         October   12, 2017 Thursday  02:10:23                                                                1                                         
    100001 TV              August    12, 2017 Saturday  10:08:30                                                            37.35                                         
    100010 TV              September 19, 2017 Tuesday   05:09:37                                                            37.35                                         
    100002 camera          September 20, 2017 Wednesday 11:09:36                                                             29.6                                         
    100003 pencil          October   08, 2017 Sunday    09:10:50                                                                0                                         
    100011 pencil          October   16, 2017 Monday    04:10:40                                                                0                                         
    100004 chair           August    23, 2017 Wednesday 04:08:35                                                             7.79                                         
    100008 lamp            August    16, 2017 Wednesday 12:08:15                                                             1.99                                         
    100007 lamp            September 10, 2017 Sunday    05:09:20                                                             3.99                                         
    100013 lamp            August    30, 2017 Wednesday 10:08:25                                                             3.99                                         
    100005 tablet          October   15, 2017 Sunday    01:10:55                                                             29.8                                         

      PUR# product name    ptime                                                                                           saving                                         
---------- --------------- ------------------------------------------------------------------------------------------- ----------                                         
    100012 computer        September 18, 2017 Monday    03:09:38                                                            299.4                                         
    100006 computer        October   12, 2017 Thursday  03:10:10                                                            149.7                                         
    100014 powerbank       October   14, 2017 Saturday  10:10:06                                                            15.01                                         

14 rows selected.

SQL> start query7
SQL> select DISTINCT e.eid from employees e, customers c where SUBSTR(e.telephone#, 1, 3) in (select  SUBSTR(c.telephone#, 1, 3) "areacode" from customers) ORDER BY e.eid Asc;

EID                                                                                                                                                                       
---                                                                                                                                                                       
e01                                                                                                                                                                       
e02                                                                                                                                                                       
e03                                                                                                                                                                       
e04                                                                                                                                                                       

SQL> start query8
SQL> select c.name from customers c, products pr, purchases pu where c.visits_made > 1 and to_char(last_visit_date, 'MM/DD/YYYY') = to_char(ptime, 'MM/DD/YYYY')  and (pr.original_price * (1 - pr.discnt_rate)) > '100' and c.cid=pu.cid and pr.pid=pu.pid;

NAME                                                                                                                                                                      
---------------                                                                                                                                                           
Kathy                                                                                                                                                                     
Chris                                                                                                                                                                     

SQL> start query9_1
SQL> select e.name from employees e where e.name not in (select e.name from employees e, purchases pu, products pr where pr.original_price >= 200 and e.eid=pu.eid and pr.pid=pu.pid);

NAME                                                                                                                                                                      
---------------                                                                                                                                                           
Mike                                                                                                                                                                      

SQL> start query9_2
SQL> select e1.name from employees e1 where not exists (select e.name from employees e, purchases pu, products pr where pr.original_price >= 200 and e.eid=pu.eid and pr.pid=pu.pid and e.eid=e1.eid);

NAME                                                                                                                                                                      
---------------                                                                                                                                                           
Mike                                                                                                                                                                      

SQL> start query10
SQL> select cid , name from customers c where not exists
  2  	     (select * from products pr where pr.pid in
  3  		     (select pu.pid from purchases pu
  4  		      where pu.cid='c005') and not exists
  5  			     (select * from purchases pu
  6  			     where c.cid=pu.cid and pr.pid=pu.pid));

CID  NAME                                                                                                                                                                 
---- ---------------                                                                                                                                                      
c003 Chris                                                                                                                                                                
c005 Mike                                                                                                                                                                 

SQL> start query11
SQL> select pu.cid from purchases pu, products pr where pu.ptime like '%OCT-17' and pr.original_price > '200' and pr.pid=pu.pid;

CID                                                                                                                                                                       
----                                                                                                                                                                      
c001                                                                                                                                                                      

SQL> start query12
SQL> select e.eid, e.name from employees e where e.eid in
  2  	     (select pu.eid from purchases pu where not exists
  3  	     (select * from customers c where c.cid in
  4  		     (select pu.cid from purchases pu, products pr
  5  		      where (pr.name like 'camera' or pr.name like 'chair') and pr.pid=pu.pid)
  6  		      and not exists
  7  			     (select pu.eid,pu.cid from purchases pu
  8  			     where pu.cid=c.cid and e.eid=pu.eid)));

EID NAME                                                                                                                                                                  
--- ---------------                                                                                                                                                       
e01 David                                                                                                                                                                 
e03 Susan                                                                                                                                                                 

SQL> start query13
SQL> select c.name, max(pu.total_price) "highest total price" from customers c, purchases pu where c.cid=pu.cid group by c.name, pu.cid;

NAME            highest total price                                                                                                                                       
--------------- -------------------                                                                                                                                       
John                           4.95                                                                                                                                       
Chris                         698.6                                                                                                                                       
Joe                          134.84                                                                                                                                       
Mike                          119.2                                                                                                                                       
Connie                       211.65                                                                                                                                       
Mike                          35.91                                                                                                                                       
Katie                          8.99                                                                                                                                       
Kathy                         349.3                                                                                                                                       

8 rows selected.

SQL> start query14
SQL> select * from (select pid, name, (original_price * discnt_rate) "discount amount"	from products
  2  order by (original_price * discnt_rate) desc)
  3  where rownum = 1;

PID  NAME            discount amount                                                                                                                                      
---- --------------- ---------------                                                                                                                                      
p008 computer                  149.7                                                                                                                                      

SQL> start query15
SQL> select to_char(ptime, 'YYYY/MM') "Month", sum(total_price) "Total Sale" from purchases group by to_char(ptime, 'YYYY/MM');

Month   Total Sale                                                                                                                                                        
------- ----------                                                                                                                                                        
2017/08     283.69                                                                                                                                                        
2017/09    1064.56                                                                                                                                                        
2017/10     627.18                                                                                                                                                        

SQL> start query16
SQL> select products.pid, products.name, sum(qty) "total quantity sold" from products, purchases where
  2  products.pid=(select pu.pid from purchases pu where qty like (select max(qty) from purchases)) and
  3  products.pid=purchases.pid group by products.name, products.pid;

PID  NAME            total quantity sold                                                                                                                                  
---- --------------- -------------------                                                                                                                                  
p004 pencil                           15                                                                                                                                  

SQL> start query17
SQL> select pu1.pur#,((pr1.original_price * pu1.qty) - pu1.total_price) "saving" from purchases pu1, products pr1
  2  where ((pr1.original_price * pu1.qty) - pu1.total_price) like (select max((pr.original_price * pu.qty) - pu.total_price) "saving" from products pr, purchases pu  where pr.pid=pu.pid)
  3  and pr1.pid=pu1.pid;

      PUR#     saving                                                                                                                                                     
---------- ----------                                                                                                                                                     
    100012      299.4                                                                                                                                                     

SQL> start query18_1
SQL> select pu.pur# from purchases pu where (total_price) >= ( select max(pu1.total_price) from purchases pu1 where pu1.cid='c006' group by pu1.cid);

      PUR#                                                                                                                                                                
----------                                                                                                                                                                
    100001                                                                                                                                                                
    100006                                                                                                                                                                
    100010                                                                                                                                                                
    100012                                                                                                                                                                

SQL> start query18_2
SQL> select pu.pur# from purchases pu where (pu.total_price) >=(select total_price from (select * from purchases pu1 where pu1.cid='c006' order by (pu1.total_price) desc) where rownum=1);

      PUR#                                                                                                                                                                
----------                                                                                                                                                                
    100001                                                                                                                                                                
    100006                                                                                                                                                                
    100010                                                                                                                                                                
    100012                                                                                                                                                                

SQL> start query19
SQL>  select *
  2   from (select pu.cid, c.name, sum(pu.total_price) "total amount spent" from purchases pu, customers c where c.cid=pu.cid group by pu.cid, c.name order by sum(pu.total_price) desc)
  3   where rownum <= 3;

CID  NAME            total amount spent                                                                                                                                   
---- --------------- ------------------                                                                                                                                   
c003 Chris                       752.68                                                                                                                                   
c001 Kathy                       679.35                                                                                                                                   
c006 Connie                      221.55                                                                                                                                   

SQL> start query20
SQL> select pr.pid, pr.name, count(pu.cid) "number of customers" from products pr Left outer join purchases pu ON pr.pid=pu.pid  and ptime like '%OCT-17' group by pr.pid, pr.name;

PID  NAME            number of customers
---- --------------- -------------------
p003 camera                            0
p004 pencil                            2
p002 TV                                0
p005 chair                             0
p006 lamp                              0
p009 powerbank                         1
p001 stapler                           1
p007 tablet                            1
p008 computer                          1

9 rows selected.

SQL> spool off







