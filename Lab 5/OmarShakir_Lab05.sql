--Lab 05
--Omar Shakir

--Question 1
SELECT Count(*) order_count,
SUM(tax_amount) total_tax
FROM orders_mgs;

--Question 2
SELECT COUNT(*) VISA_ORDER_COUNT,
SUM(TAX_AMOUNT)VISA_TOTAL_TAX
FROM orders_mgs
WHERE card_type IN ('Visa')
GROUP BY card_type;

--Question 3
SELECT card_type, COUNT(*) CARD_ORDER_COUNT,
SUM(tax_amount) CARD_TOTAL_TAX
FROM orders_mgs
GROUP BY card_type;

--Question 4
SELECT c.category_name, COUNT(*) PRODUCT_COUNT,
MAX(list_price) HIGHEST_LISTING_PRICE,
MIN(list_price) LOWEST_LISTING_PRICE FROM
categories_mgs c INNER JOIN
products_mgs p on c.category_id=p.category_id
GROUP BY c.category_name;

--Question 5
SELECT c.category_name, COUNT(*) PRODUCT_COUNT_OVER$400,
MAX(list_price) HIGHEST_LISTING_PRICE_OVER$400,
MIN(list_price) LOWEST_LISTING_PRICE_OVER$400 FROM
categories_mgs c INNER JOIN
products_mgs p ON c.category_id=p.category_id
WHERE p.list_price>400
GROUP BY c.category_name;

--Question 6
SELECT card_type, COUNT(*) HOT_CAT_CARD_ORDER_COUNT,
SUM(tax_amount) HOT_CAT_CARD_TOTAL_TAX
FROM orders_mgs
GROUP BY card_type
HAVING COUNT(*)>2;

--Question 7
SELECT c.category_name, COUNT(*) HOT_CAT_PRODUCT_COUNT,
MAX(list_price) HOT_CAT_HIGHEST_LISTING_PRICE,
MIN(list_price) HOT_CAT_LOWEST_LISTING_PRICE FROM
categories_mgs c INNER JOIN
products_mgs p on c.category_id=p.category_id
GROUP BY c.category_name,p.category_id
HAVING COUNT(*)>2;

--Question 8
SELECT card_type, COUNT(*) HOT_CARD_ORDER_COUNT,
SUM(tax_amount) HOT_CARD_TOTAL_TAX
FROM orders_mgs
WHERE order_date>'30-MAR-2012'
GROUP BY card_type
HAVING COUNT(*)>2;