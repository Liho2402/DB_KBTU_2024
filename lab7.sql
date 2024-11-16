create database lab7;

create table products (
    product_id int primary key ,
    product_name varchar(50),
    price decimal(10, 2)
);

insert into products(product_id, product_name, price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 500.00),
(4, 'Monitor', 300.00),
(5, 'Keyboard', 50.00);

create index idx_product_name on products(product_name);

create table customers(
    customer_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100)
);

insert into customers(customer_id, first_name, last_name, email) values
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Alice', 'Smith', 'alice.smith@example.com'),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com'),
(4, 'Emma', 'Brown', 'emma.brown@example.com'),
(5, 'Michael', 'Green', 'michael.green@example.com');

create index idx_customer_name on customers(first_name, last_name);

create table orders(
    order_id int primary key,
    order_total decimal(10,2),
    customer_id int,
    order_date date
);

insert into orders(order_id, order_total, customer_id, order_date) values
(1001, 1500.00, 1, '2023-01-15'),
(1002, 750.00, 2, '2023-02-20'),
(1003, 2200.00, 3, '2023-03-25'),
(1004, 600.00, 4, '2023-04-10'),
(1005, 1200.00, 5, '2023-05-05');

create index idx_lower_email on customers(email);

create table order_item(
    order_item_id int primary key,
    order_id int,
    product_id int,
    quantity int
);

insert into order_item (order_item_id, order_id, product_id, quantity) values
(1, 1001, 1, 1),
(2, 1001, 2, 2),
(3, 1002, 3, 1),
(4, 1003, 1, 1),
(5, 1003, 4, 3),
(6, 1004, 5, 4),
(7, 1005, 2, 1);

create index idx_order_total on orders(order_total);

create index idx_order_tem_quantity on order_item(quantity);