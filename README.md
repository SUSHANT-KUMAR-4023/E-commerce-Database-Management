# E-commerce-database-management
This system is designed to support a comprehensive range of e-commerce operations, providing a robust framework for managing user accounts, product listings, inventory levels, order processing, and customer reviews.

Tables
users

Description: Stores information about users.
Columns:
user_id (INT, Auto Increment, Primary Key): Unique identifier for the user.
username (VARCHAR(255), Unique, Not Null): Username of the user.
email (VARCHAR(255), Unique, Not Null): Email address of the user.
password_hash (VARCHAR(255), Not Null): Hashed password for authentication.
first_name (VARCHAR(255)): First name of the user.
last_name (VARCHAR(255)): Last name of the user.
created_at (DATETIME, Not Null, Default: CURRENT_TIMESTAMP): Timestamp when the user was created.
updated_at (DATETIME, Not Null, Default: CURRENT_TIMESTAMP, On Update: CURRENT_TIMESTAMP): Timestamp when the user information was last updated.
categories

Description: Stores product categories.
Columns:
category_id (INT, Auto Increment, Primary Key): Unique identifier for the category.
name (VARCHAR(255), Not Null): Name of the category.
description (TEXT): Description of the category.
products

Description: Stores information about products.
Columns:
product_id (INT, Auto Increment, Primary Key): Unique identifier for the product.
name (VARCHAR(255), Not Null): Name of the product.
description (TEXT): Description of the product.
price (DECIMAL(10,2), Not Null): Price of the product.
category_id (INT): Foreign Key referencing categories(category_id).
created_at (DATETIME, Not Null, Default: CURRENT_TIMESTAMP): Timestamp when the product was created.
updated_at (DATETIME, Not Null, Default: CURRENT_TIMESTAMP, On Update: CURRENT_TIMESTAMP): Timestamp when the product information was last updated.
orders

Description: Stores order information.
Columns:
order_id (INT, Auto Increment, Primary Key): Unique identifier for the order.
user_id (INT, Not Null): Foreign Key referencing users(user_id).
order_date (DATETIME, Not Null, Default: CURRENT_TIMESTAMP): Timestamp when the order was placed.
status (VARCHAR(50), Not Null): Status of the order (e.g., 'Pending', 'Shipped').
total_amount (DECIMAL(10,2), Not Null): Total amount of the order.
order_items

Description: Stores items in an order.
Columns:
order_item_id (INT, Auto Increment, Primary Key): Unique identifier for the order item.
order_id (INT, Not Null): Foreign Key referencing orders(order_id).
product_id (INT, Not Null): Foreign Key referencing products(product_id).
quantity (INT, Not Null): Quantity of the product ordered.
price (DECIMAL(10,2), Not Null): Price of the product at the time of the order.
inventory

Description: Stores product inventory information.
Columns:
inventory_id (INT, Auto Increment, Primary Key): Unique identifier for the inventory record.
product_id (INT, Not Null): Foreign Key referencing products(product_id).
quantity_in_stock (INT, Not Null): Quantity of the product in stock.
last_updated (DATETIME, Not Null, Default: CURRENT_TIMESTAMP, On Update: CURRENT_TIMESTAMP): Timestamp when the inventory was last updated.
addresses

Description: Stores user addresses.
Columns:
address_id (INT, Auto Increment, Primary Key): Unique identifier for the address.
user_id (INT, Not Null): Foreign Key referencing users(user_id).
street (VARCHAR(255), Not Null): Street address.
city (VARCHAR(255), Not Null): City.
state (VARCHAR(255), Not Null): State.
postal_code (VARCHAR(20), Not Null): Postal code.
country (VARCHAR(255), Not Null): Country.
reviews

Description: Stores product reviews.
Columns:
review_id (INT, Auto Increment, Primary Key): Unique identifier for the review.
product_id (INT, Not Null): Foreign Key referencing products(product_id).
user_id (INT, Not Null): Foreign Key referencing users(user_id).
rating (INT, Not Null, Check: rating BETWEEN 1 AND 5): Rating given by the user.
comment (TEXT): Review comment.
created_at (DATETIME, Not Null, Default: CURRENT_TIMESTAMP): Timestamp when the review was created.
Indexes
idx_orders_user_id: Index on orders(user_id) to improve query performance for user-based order retrieval.
idx_order_items_order_id: Index on order_items(order_id) to improve query performance for order-based item retrieval.
idx_order_items_product_id: Index on order_items(product_id) to improve query performance for product-based item retrieval.
idx_inventory_product_id: Index on inventory(product_id) to improve query performance for inventory-based product retrieval.
idx_addresses_user_id: Index on addresses(user_id) to improve query performance for address-based user retrieval.
idx_reviews_product_id: Index on reviews(product_id) to improve query performance for product-based review retrieval.
idx_reviews_user_id: Index on reviews(user_id) to improve query performance for user-based review retrieval.
