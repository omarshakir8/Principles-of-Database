--Lab 3
--Omar Shakir

-- Q1
SELECT customer_id, line1, line2,
city, addresses_mgs.state
FROM addresses_mgs
WHERE line1 LIKE ('%wood%')
ORDER BY state, city;

-- Q2
SELECT first_name, last_name, email_address
FROM customers_mgs WHERE first_name LIKE('__r%')
ORDER BY first_name;


-- Q3
SELECT p.product_name, p.list_price, c.category_name FROM
products_mgs p INNER JOIN categories_mgs c
ON(p.category_id=c.category_id)
ORDER BY c.category_name,p.product_name;


-- Q4
SELECT c.first_name, c.last_name,
a.line1, a.line2, a.city, a.state, a.zip_code FROM 
customers_mgs c INNER JOIN addresses_mgs a 
ON(c.customer_id=a.customer_id)
WHERE c.email_address IN ('heatheresway@mac.com');

-- Q5
SELECT c.first_name, c.last_name,
a.line1, a.line2, a.city, a.state, a.zip_code FROM 
customers_mgs c INNER JOIN addresses_mgs a 
ON(c.billing_address_id=a.address_id)
ORDER BY a.state, a.city;


-- Q6
SELECT c.first_name, c.last_name,
TO_CHAR(o.order_date,'mm/dd/yyyy') ORDER_DATE,
TO_CHAR (o.ship_date,'mm/dd/yyyy') SHIP_DATE FROM
customers_mgs c INNER JOIN orders_mgs o
ON(c.customer_id=o.customer_id);

-- Q7
SELECT c.email_address, o.ship_date, i.product_id, 
(item_price*quantity)-discount_amount ACTURAL_PRICE FROM
customers_mgs c INNER JOIN orders_mgs o
ON(c.customer_id=o.customer_id)
INNER JOIN order_items_mgs i 
ON(o.order_id=i.order_id);

-- Q8
SELECT DISTINCT p.product_code, p.product_name, 
p.discount_percent FROM
products_mgs p JOIN products_mgs q
ON(p.discount_percent=q.discount_percent
AND p.product_id !=q.product_id)
ORDER BY p.product_code;
