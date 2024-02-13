--Wk2 Q & A
--In Class Practice for Murach-Ch3


--Covered topics:
----WHERE, ORDER BY clauses
----Basic comparison, logical operators
----ROWNUM, ||, column alias
----LIKE, wildcard characters
----Dual table, scalar function

--Run the statements using user AP unless otherwise indicated.

--1.
--print names, dept numbers of employees supervised by manager with id 7839
--  in the increasing order of employee names


SELECT ename, deptno
FROM   emp
WHERE  mgr = 7839
ORDER BY  ename;



--2.
--For the above query, limit the query result to be at most 2 rows

SELECT ename, empno
FROM   emp
WHERE  mgr = 7839 AND ROWNUM <= 2
ORDER BY  ename;

--3.
--print all employees' work information and 
--display the heading of the query result to be Work Info
--Sample Output:
---- Work Info
---- KING works in Dept 10
---- BLAKE works in Dept 30


SELECT ename || ' works in Dept ' || deptno AS  "Work Info"
FROM  emp;

--AS optional
SELECT ename || ' works in Dept ' || deptno  "Work Info"
FROM  emp;

--4.
--use the tables in user EX
--print the first names, last names of customers whose first name start with Jo


SELECT customer_first_name, customer_last_name
FROM   customers_ex
WHERE  customer_first_name LIKE 'Jo%';    



--5.
--car loan: 
-- Simplified and do not consider compound interest
-- loan amount: $20000,  loan interest rate: 6%, 
-- Print the car loan principal amount, total interest amount, 
--      the total amount you would pay after the principal is paid off,
--      and the current date in the default date format.
-- Display the headings of query result like this:
-- Principal    Interest Amount      Total Payment    Today
--   20000        1200                 21200          29-JAN-19

SELECT  20000 "Principal", 20000*0.06 "Interest Amount", 
        20000*1.06 "Total Payment",
        SYSDATE "Today"
FROM    dual;


--6. 
-- Print the date and time when the query is executed.
-- Print the date and time in the format below ( time in 24 hour notation)
-- Display the heading for the query result as System Date
---Sample Output
-----System Date
-----28-jan-2021 15:16:17

--answer
SELECT  TO_CHAR(SYSDATE, 'dd-mon-yyyy hh24:mi:ss') "System Date"
FROM    dual;

--or
SELECT  TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') "System Date"
FROM    dual;


