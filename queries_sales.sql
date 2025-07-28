Select *
from olist_orders;

--GMV by product category
Create or replace view category_gmv as 
Select op.product_category_name, ROUND(SUM(oi.price)::NUMERIC,2) as gmv
from olist_order_items oi
join olist_products op on oi.product_id=op.product_id
group by op.product_category_name
order by gmv desc;

--Revenue,COGS,Net Profit by each product category
--Assumed 30% profit
Create or replace view category_rev_cogs_profit as
Select
	op.product_category_name as product_category,
	SUM(oi.price) as revenue,
	SUM(oi.price * 0.7) as COGS,
	SUM(oi.price * 0.3) as net_profit
from olist_order_items oi
join olist_products op on oi.product_id=op.product_id
group by op.product_category_name
order by net_profit desc;


--order_delivery_before_date
Create or replace view order_delivered_before as 
Select (Select count(*) from olist_orders where order_delivered_customer_date<order_estimated_delivered_date)*100/(count(*)) as percent_orders_delivered_before_expected
from olist_orders
where order_status='delivered'

--avg_delays
Create or replace view order_delays as
Select order_status,AVG(order_delivered_customer_date - order_estimated_delivered_date) as avg_delays
from olist_orders
where order_delivered_customer_date is not null and order_delivered_customer_date>order_estimated_delivered_date
group by order_status

--Total Sales by each product
Create or replace view total_sales as
Select oi.product_id,op.product_category_name,count(*) as units_sold,ROUND(sum(oi.price)::NUMERIC,2) as total_sales
from olist_order_items oi
join olist_products op on oi.product_id=op.product_id
group by oi.product_id,op.product_category_name
order by total_sales desc;

--items sold by each product and their rating
Create or replace view units_rating as 
Select op.product_category_name,count(*) as units_sold,ROUND(avg(oor.review_score),2) as avg_rating
from olist_order_items oi
join olist_products op on oi.product_id=op.product_id
join olist_order_reviews oor on oi.order_id=oor.order_id
group by op.product_category_name
order by units_sold desc;

--cancellation rate
Create or replace view can_rate as 
Select ROUND(((select count(*) from olist_orders where order_status='canceled')::FLOAT/count(*))::NUMERIC,3) as can_rate
from olist_orders

--order_status distribution
Create or replace view order_status_dis as 
Select order_status,Count(*) as cnt
from olist_orders
group by order_status
order by cnt desc


