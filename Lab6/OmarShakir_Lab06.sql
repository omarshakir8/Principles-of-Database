--Lab06
--Omar Shakir

--Question 1
SELECT DISTINCT category_name
FROM categories_mgs c WHERE 
c.category_id IN 
(SELECT p.category_id FROM products_mgs p)
ORDER BY category_name;

--Question 2
SELECT p.product_name,(p.list_price*((100 - p.discount_percent)/100)) ACTUAL_PRICE
FROM products_mgs p
WHERE (p.list_price*((100 - p.discount_percent)/100))>
(SELECT AVG((a.list_price*((100 - a.discount_percent)/100))) FROM products_mgs a)
ORDER BY (p.list_price*((100 - p.discount_percent)/100)) DESC;


--Question 3
SELECT c.category_id, c.category_name FROM categories_mgs c
WHERE c.category_id NOT IN (SELECT DISTINCT p.category_id FROM products_mgs p);

--Question 4
SELECT *FROM (SELECT a.product_id, a.product_code, a.product_name,
(a.list_price*((100 - a.discount_percent)/100)) ACTUAL_PRICE
FROM products_mgs a 
WHERE ROWNUM<=3
ORDER BY (a.list_price*((100 - a.discount_percent)/100)) DESC);

--Question 5
SELECT * FROM (SELECT a.product_id, a.product_code, a.product_name, 
b.category_name, (a.list_price*((100 - a.discount_percent)/100)) ACTUAL_PRICE
FROM products_mgs a INNER JOIN categories_mgs b 
ON a.category_id=b.category_id
WHERE rownum<=3
ORDER BY (a.list_price*((100 - a.discount_percent)/100)) DESC);

--Question 6
SELECT * FROM (SELECT b.category_id, COUNT(*) FROM 
products_mgs b GROUP BY b.category_id
ORDER BY COUNT(*) DESC,b.category_id ASC);

--Question 7
SELECT a.product_name, a.discount_percent FROM products_mgs a
WHERE a.discount_percent IN (
SELECT b.discount_percent
FROM products_mgs b GROUP BY b.discount_percent
HAVING COUNT(*)=1)
ORDER BY a.product_name ASC;

--Question 8a
SELECT a.email_address, b.order_id, SUM(c.item_price-c.discount_amount) ORDER_TOTAL
FROM customers_mgs a JOIN
orders_mgs b ON 
(a.customer_id=b.customer_id)JOIN
order_items_mgs c ON (b.order_id=c.order_id)
GROUP BY a.email_address, b.order_id;

--Question 8b
SELECT * FROM (SELECT a.email_address, SUM(c.item_price-c.discount_amount)
MAX_ORDER_TOTAL
FROM customers_mgs a JOIN
orders_mgs b ON 
(a.customer_id=b.customer_id)JOIN
order_items_mgs c ON (b.order_id=c.order_id)
GROUP BY a.email_address,b.order_id
ORDER BY a.email_address ASC);