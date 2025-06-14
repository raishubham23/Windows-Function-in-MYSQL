use ayub;

Create table Persons (
id int primary key,
First_Name varchar(20) not null,
Last_Name varchar(20),
age integer);
insert into persons values(1,"Ajay",null,20);
select * from persons;
insert into persons values(1,"Vijay","Kumar",25); 
#11:10:47	insert into persons values(1,"Vijay","Kumar",25)	
#Error Code: 1062. Duplicate entry '1' for key 'persons.PRIMARY'	0.015 sec
insert into persons values (null,"vijay","Kumar",30);
#11:11:57	insert into persons values (null,"vijay","Kumar",30)	
#Error Code: 1048. Column 'id' cannot be null	0.016 sec

create table orders (
order_id int primary key, 
ordernum int not null,
person_id integer,
foreign key (person_id) references
persons(id));

INSERT INTO ORDERS VALUES (123,9876,1);
INSERT INTO ORDERS VALUES (234,9876,1);
SELECT * FROM ORDERS;

#WINDOWS FUNCTION :- START FROM OVER
#3 CONDITIONS IN WINDOWS FUNCTIONS
#1 ORDER BY
#2 PARTITION BY
## 3 PARTITION BY & ORDER BY

SELECT * FROM myemp;

SELECT * FROM myemp LIMIT 10;

SELECT * FROM myemp order by SALARY DESC limit 10 ;

# GET THE HIGHIEST SALARY EMP INFO

SELECT * FROM myemp order by SALARY DESC limit 1;

# GET THE HIGHIEST SALARY EMP INFO

SELECT * FROM (
SELECT * FROM myemp order by SALARY desc LIMIT 5)AB
ORDER BY SALARY LIMIT 1;

CREATE TABLE STUDENT1(ID INT, NAME VARCHAR(20), SCORE INT);

INSERT INTO STUDENT1 VALUES (1,"AJAY","90"),(2,"JOHN",87),(3,"RAM",87),
(4,"JENI",70);

INSERT INTO STUDENT1 VALUES (5,"SITA",75),(6,"AJAY",50),(6,"VIJAY",50);

SELECT * FROM STUDENT1;

SELECT NAME,SCORE FROM student1;

SELECT row_number() OVER (order by SCORE DESC)
S_NO,NAME,SCORE FROM student1;

SELECT NAME,SCORE,RANK() OVER (ORDER BY SCORE DESC)RNK FROM student1;

SELECT NAME,SCORE,DENSE_RANK() OVER (ORDER BY SCORE DESC)DRNK FROM STUDENT1; 

### COUNTRY WISE TOTAL SALES WITH SR_NOS (SUPERSTORE)

SELECT ROW_NUMBER() OVER() S_NO,COUNTRY, SUM(SALES)T_SALES FROM superstore
GROUP BY 2;

# GET THE RANK BASED ON THE COUNTRY & SALES FROM SUPERSTORE

SELECT DENSE_RANK() OVER(order by SUM(SALES) DESC)DRANK,Country,SUM(SALES)T_SALES
FROM superstore
group by 2;

# SELECT THE 3RD HIGHEST SALARY FROM MYEMP

SELECT * FROM(
SELECT * FROM MYEMP order by SALARY DESC LIMIT 3)AB
ORDER BY SALARY LIMIT 1;  

SELECT * FROM(
SELECT *,row_number() OVER (order by SALARY DESC)SRO FROM MYEMP) AA
WHERE SRO = 3;

SELECT * FROM(
SELECT *, DENSE_RANK() OVER (ORDER BY SALARY DESC)DRANK FROM MYEMP) AB
WHERE DRANK = 3; # RIGHT ANSWER#
