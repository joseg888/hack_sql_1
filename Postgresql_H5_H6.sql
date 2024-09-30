-- H5 --

create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);


create table roles(
  id_role serial primary key,
  name varchar(40) not null  
);

create table taxes(
  id_tax serial primary key,
  percentage numeric(5, 2)
);

create table offers(
	id_offer serial primary key,
	status text
);

create table discounts(
	id_discount serial primary key,
	status text,
	percentage numeric(5, 2)
);

create table payments(
	id_payment serial primary key,
	type varchar(50)
);

create table customers (
    id_customer serial primary key,
    email varchar(80),
    id_country integer,
    id_role integer,
    foreign key (id_country) references countries (id_country) on delete cascade,
    foreign key (id_role) references roles (id_role) on delete cascade,	
    name varchar(50),
    age smallint,
    password varchar(50),
    physical_address text
);

create table invoice_status (
	id_invoice_status serial primary key,
	status text
);

create table products (
	id_product serial primary key,
    id_discount integer,
    id_offer integer,
	id_tax integer,
    foreign key (id_discount) references discounts (id_discount) on delete cascade,
    foreign key (id_offer) references offers (id_offer) on delete cascade,
    foreign key (id_tax) references taxes (id_tax) on delete cascade,		
	name varchar(100),
	details text,
	minimum_stock int,
	maximum_stock int,
	current_stock int,
	price numeric(10,2),
	price_with_tax numeric(10,2)
);

create table products_customers (
    id_product integer,
	id_customer integer,
    foreign key (id_product) references products (id_product) on delete cascade,
	foreign key (id_customer) references customers (id_customer) on delete cascade,
    PRIMARY KEY (id_product, id_customer)
);

create table invoices (
	id_invoice serial primary key,
	id_customer integer,
    id_payment integer,
	id_invoice_status integer,
	foreign key (id_customer) references customers (id_customer) on delete cascade,
    foreign key (id_payment) references payments (id_payment) on delete cascade,
    foreign key (id_invoice_status) references invoice_status (id_invoice_status) on delete cascade,
	date date,
	total_to_pay numeric(10,2)
);

create table orders (
	id_order serial primary key,
	id_invoice integer,
	id_product integer,
	foreign key (id_invoice) references invoices (id_invoice) on delete cascade,  
	foreign key (id_product) references products (id_product) on delete cascade,
	detail text,
	amount int,
	price numeric(10,2)
);
-------------------------------------------------------------------------------------------------------------------------
-- H6 --

INSERT INTO countries (name) VALUES ('Estados Unidos'), ('Brasil'), ('Argentina');
select * from countries;

INSERT INTO roles (name) VALUES ('admin'), ('editor'), ('viewer');
select * from roles;

INSERT INTO taxes (percentage) VALUES (10), (20), (30);
select * from taxes;

INSERT INTO offers (status) VALUES ('active'), ('inactive'), ('discontinued');
select * from offers;

INSERT INTO discounts (status, percentage) VALUES ('Active', 10), ('Active', 20), ('Inactive', 30);
select * from discounts;

INSERT INTO payments (type) VALUES ('cash'), ('Debit Card'), ('Credit card');
select * from payments;

INSERT INTO customers (email, id_country, id_role, name, age, password, physical_address) VALUES
	('jose@gmail.com', 1, 1, 'gregorio', 29, 'jose321', 'los teques'),
	('frank@gmail.com', 2, 2, 'blanco', 30, 'frank654!', 'caracas'),
	('david@gmail.com', 3, 3, 'salomon', 28, 'david987', 'la victoria');
select * from customers;

INSERT INTO invoice_status (status) VALUES ('Paid'), ('Pending'), ('Overdue');
select * from invoice_status;

INSERT INTO products (id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) VALUES
	(1, 1, 1, 'laptop', 'lenovo', 20, 50, 40, 500, 600.25),
	(2, 2, 2, 'control', 'play station', 50, 100, 80, 60, 65.00),
	(3, 3, 3, 'computadora', 'asus', 10, 40, 35, 900, 1020.30);
select * from products;

INSERT INTO products_customers (id_product, id_customer) VALUES 
	(1, 1),
	(2, 2),
	(3, 3);
select * from products_customers;

INSERT INTO invoices (id_customer, id_payment, id_invoice_status, date, total_to_pay) VALUES
	(1, 1, 1, '08-07-2024', 400.50),
	(2, 2, 2, '08-08-2024', 40.50),
	(3, 3, 3, '08-09-2024', 800.50);
select * from invoices;

INSERT INTO orders (id_invoice, id_product, detail, amount, price) VALUES 
	(1, 1, 'laptop', 1, 400.50),
	(2, 2, 'control', 1, 40.50),
	(3, 3, 'computadora', 1, 800.50);
select * from orders;

DELETE FROM customers WHERE email='jose@gmail.com';
select * from customers;

UPDATE customers SET name='david salomon', age=30, password='salomon987' WHERE id_customer=3;
select * from customers;

UPDATE taxes SET percentage=50;
select * from taxes;

UPDATE orders SET price=800.00;
select * from orders;

UPDATE products SET price=800.00;
select * from products;
