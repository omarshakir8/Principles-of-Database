--Omar Shakir
--Lab 08

--Question 1
INSERT INTO categories_mgs
VALUES (5,'Percussion');

COMMIT;

--Question 2
UPDATE categories_mgs
SET category_name='String'
WHERE category_id=5;

--Question 3
DELETE categories_mgs
WHERE category_name='String';

--Question 4
INSERT INTO products_mgs (product_id, category_id, product_code, product_name,
description, list_price, discount_percent, date_added)
VALUES (11,4,'YDP162R','Yamaha Arius YDP162R Traditional Console Style Digital Piano',
'The best keyboard on the market. Offers excellent sound rendering that truly separates 
it from the rest of the pack.',1599.99,10,SYSDATE);

--Question 5

DELETE products_mgs WHERE category_id=4;

DELETE categories_mgs
WHERE category_id =4;

rollback;

--Question 6
INSERT INTO customers_mgs
(customer_id, email_address, password, first_name, last_name)
VALUES (9,'john@yahoo.com','funny','John','Oliver');

--Question 7
UPDATE customers_mgs
SET password='hello';

--Question 8
UPDATE customers_mgs
SET password='excellent'
WHERE customer_id IN (
SELECT DISTINCT a.customer_id
FROM orders_mgs a
GROUP BY a.customer_id HAVING
COUNT(*)>1);

--Question 9
rollback;

--Question 10


--Question 11
CREATE TABLE Event (
event_id NUMBER   NOT NULL  UNIQUE,
event_date     DATE   NOT NULL,        
event_location VARCHAR2(100)     NOT NULL,
menu_id NUMBER PRIMARY KEY);

CREATE TABLE menu (
menu_id UNIQUE  REFERENCES Event (menu_id),
menu_description  VARCHAR(1000) NOT NULL,
menu_type VARCHAR(50)  NOT NULL);

--Question 12
DROP table menu;
DROP table event;

--Question 13
CREATE INDEX event_date_ix 
ON event(event_date);

--Question 14
CREATE SEQUENCE menu_id;

--Question 15

--Must add something in event as well to avoid constraint error 
INSERT INTO event VALUES 
(100,'22-JUN-23','Amsterdam',menu_id.nextval);

INSERT INTO menu
VALUES(menu_id.currval, 'Menu 1 for vegetarians', 'Vegetarian');