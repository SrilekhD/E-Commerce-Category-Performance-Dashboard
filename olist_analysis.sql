Create Table olist_customers(customer_id varchar,customer_unique_id varchar,customer_zip_code_prefix INT,customer_city varchar,customer_state varchar(2))
COPY olist_customers
FROM '/Users/srilekh/Downloads/cleaned_olist_data/cleaned_olist_customers_dataset.csv'
WITH (
    FORMAT csv,
    HEADER,
    DELIMITER ',',
    ENCODING 'UTF8',
    QUOTE '"',
    ESCAPE '"'
);

Create Table olist_order_items(order_id varchar,order_item_id INT,product_id varchar,seller_id varchar,shipping_limit_date TIMESTAMP,price float,freight_value float)
COPY olist_order_items
FROM '/Users/srilekh/Downloads/cleaned_olist_data/cleaned_olist_order_items_dataset.csv'
WITH (
    FORMAT csv,
    HEADER,
    DELIMITER ',',
    ENCODING 'UTF8',
    QUOTE '"',
    ESCAPE '"'
);

Create Table olist_orders(order_id varchar,customer_id varchar,order_status varchar,order_purchase_timestamp TIMESTAMP,order_approved_at TIMESTAMP,order_delivered_carrier_date TIMESTAMP,order_delivered_customer_date TIMESTAMP,order_estimated_delivered_date TIMESTAMP)
COPY olist_orders
FROM '/Users/srilekh/Downloads/cleaned_olist_data/cleaned_olist_orders_dataset.csv'
WITH (
    FORMAT csv,
    HEADER,
    DELIMITER ',',
    ENCODING 'UTF8',
    QUOTE '"',
    ESCAPE '"'
);

Create Table olist_products(product_id varchar Primary key,product_category_name varchar,product_name_lenght float,product_description_lenght float,product_photos_qty float,product_weight_g float,product_length_cm float,product_height_cm float,product_width_cm float)
COPY olist_products
FROM '/Users/srilekh/Downloads/cleaned_olist_data/cleaned_olist_products_dataset.csv'
WITH (
    FORMAT csv,
    HEADER,
    DELIMITER ',',
    ENCODING 'UTF8',
    QUOTE '"',
    ESCAPE '"'
);

Create Table olist_order_reviews(review_id varchar,order_id varchar,review_score INT,review_comment_title varchar,review_comment_message varchar,review_creation_date TIMESTAMP,review_answer_timestamp TIMESTAMP)
COPY olist_order_reviews
FROM '/Users/srilekh/Downloads/cleaned_olist_data/cleaned_olist_order_reviews_dataset.csv'
WITH (
    FORMAT csv,
    HEADER,
    DELIMITER ',',
    ENCODING 'UTF8',
    QUOTE '"',
    ESCAPE '"'
);