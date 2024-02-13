--Lab 04
-- Omar Shakir

--Question 1
SELECT p.category_id, q.category_name, 
p.product_id, p.product_name
FROM products_mgs p JOIN
categories_mgs q ON 
p.category_id=q.category_id
ORDER BY p.product_id;

--Question 2
SELECT q.category_id, q.category_name,
p.product_id, p.product_name
FROM categories_mgs q LEFT OUTER JOIN
products_mgs p ON
q.category_id=p.category_id
ORDER BY p.product_id;

--Question 3
SELECT q.category_id, q.category_name
FROM categories_mgs q LEFT OUTER JOIN
products_mgs p ON q.category_id=p.category_id
WHERE p.category_id IS NULL;

--Question 4
SELECT c.customer_id, c.first_name, c.last_name
FROM customers_mgs c
WHERE c.email_address LIKE ('%@gmail.com%')
INTERSECT SELECT a.customer_id, a.first_name,
a.last_name FROM customers_mgs a JOIN
orders_mgs b ON a.customer_id=b.customer_id
WHERE b.ship_address_id = b.billing_address_id
ORDER BY customer_id ASC
;

--Question 5
SELECT c.customer_id, c.first_name, c.last_name
FROM customers_mgs c
WHERE c.email_address NOT LIKE ('%@gmail.com%')
INTERSECT SELECT a.customer_id, a.first_name,
a.last_name FROM customers_mgs a JOIN
orders_mgs b ON a.customer_id=b.customer_id
WHERE b.ship_address_id = b.billing_address_id
ORDER BY customer_id ASC;

--Question 6
SELECT c.customer_id, c.first_name, c.last_name
FROM customers_mgs c
WHERE c.email_address LIKE ('%@gmail.com%')
UNION SELECT a.customer_id, a.first_name,
a.last_name FROM customers_mgs a JOIN
orders_mgs b ON a.customer_id=b.customer_id
WHERE b.ship_address_id = b.billing_address_id
ORDER BY customer_id ASC;

--Question 7
SELECT c.order_id, c.customer_id, 'Shipped'
AS SHIP_STATUS, c.order_date
FROM orders_mgs c
WHERE c.ship_date IS NOT null
UNION SELECT
d.order_id, d.customer_id, 'Not Shipped'
AS SHIP_STATUS, d.order_date
FROM orders_mgs d
WHERE d.ship_date IS null
ORDER by order_date;




