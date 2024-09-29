ALTER TABLE `sales`.`orders` 
CHANGE COLUMN `Order ID` `OrderID` TEXT NULL DEFAULT NULL ;

ALTER TABLE `sales`.`orders` 
CHANGE COLUMN `Order DATE` `OrderDate` TEXT ;

ALTER TABLE `sales`.`DETAILS`
ADD COLUMN SALES INT;

UPDATE `sales`.`DETAILS`
SET SALES=AMOUNT*QUANTITY;


-- 1.Total amount of sales --

SELECT 
    SUM(SALES) AS total_sales
FROM
    details;

-- 2.total quantity of products sold--

SELECT 
    COUNT(quantity) AS product_quantity
FROM
    details;

-- 3.number of orders--

SELECT 
    COUNT(*)
FROM
    orders;

-- 4.distinct product category sales--

SELECT 
    category, SUM(SALES) AS sales
FROM
    details
GROUP BY category;

-- 5.total ammount for each payment mode--

SELECT 
    paymentmode, SUM(amount) AS total_amount
FROM
    details
GROUP BY paymentmode;

-- 6. find all the orders ,profit placed in a specific state --

SELECT 
    o.state, SUM(d.profit) AS total_profit
FROM
    orders o
        JOIN
    details d ON o.orderid = d.orderid
GROUP BY state
ORDER BY total_profit DESC;

-- 7.total sales ammount and profit for each city--

SELECT 
    o.city,
    SUM(d.sales) AS total_sales,
    SUM(d.profit) AS total_profit
FROM
    details d
        JOIN
    orders o ON o.orderid = d.orderid
GROUP BY city
ORDER BY total_sales DESC;

-- 8.Total sale amount for each month --

SELECT 
    MONTHNAME(STR_TO_DATE(orderdate, '%d-%m-%y')) AS name_month,
    SUM(d.sales) AS total_sales
FROM
    orders o
        JOIN
    details d ON o.orderid = d.orderid
GROUP BY name_month
ORDER BY total_sales DESC;

-- 9. top 5 products with the highest sales growth rate over the year --
-- using aggregate function--

SELECT 
    subcategory, MAX(sales)
FROM
    details
GROUP BY subcategory
ORDER BY MAX(sales) DESC;

-- using cte(common table expression)--

with sales_cte as (
select subcategory, sales,
rank() over(partition by subcategory order by sales desc ) as rk
from details
)
select subcategory ,max(sales) as sales
from sales_cte
group by subcategory
order by sales desc
limit 5;

-- 10. pair of products that are freequently brought --

with transaction_products as (
select o.orderid,d.subcategory as product
from orders o 
join details d 
on  o.orderid=d.orderid
),
product_pairs as (
select a.orderid,
a.product as product_a,
b.product as product_b
from transaction_products a
join  transaction_products b 
on a.orderid=b.orderid and
a.product<b.product
),
pair_counts as (
select product_a,product_B,count(*) as pair_count
from product_pairs
group by product_a,product_b
),
product_counts as (
select product, count(distinct orderid) as order_count 
from transaction_products
group by product
)
select pc.product_a,
 pc.product_b,
pc.pair_count as paircount
from pair_counts pc
order by paircount desc;

-- 11.customer segmentation based on their total amount--

with customer_seg as (
select orderid,sum(sales) as total_spent
from details
group by orderid
)
select orderid,total_spent,
case when total_spent>10000 then 'High'
when total_spent between 5000 and 10000 then 'Medium'
else 'low'
end as spending_category
from customer_seg








































