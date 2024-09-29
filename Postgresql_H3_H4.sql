-- H3 --

create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table priorities(
  id_priority serial primary key,
  type_name varchar(50) not null  
);

create table contact_request(
   id_email VARCHAR(50) PRIMARY KEY, 
   id_country integer not null, 
   id_priority integer not null, 
   name VARCHAR(50) not null, 
   detail VARCHAR(100) not null, 
   physical_address varchar (100) not null, 
   foreign key (id_country) references countries (id_country), 
   foreign key (id_priority) references priorities (id_priority) 
);
--------------------------------------------------------------------------------------------------------
-- H4 --

insert into countries (name) values ('Estados Unidos'), ('Brasil'), ('Argentina'), ('Venezuela'), ('Alemania');
select * from countries;

insert into priorities (type_name) values ('Alta'), ('Media'), ('Baja');
select * from priorities;

insert into contact_request (id_email, id_country,  id_priority, name, detail, physical_address) values ('jose@gmail.com', 1, 1, 'gregorio', 'azul', 'los teques'); 

insert into contact_request (id_email, id_country,  id_priority, name, detail, physical_address) values ('frank@gmail.com', 2, 2, 'blanco', 'rojo', 'caracas'); 

insert into contact_request (id_email, id_country,  id_priority, name, detail, physical_address) values ('david@gmail.com', 3, 3, 'salomon', 'negro', 'la victoria'); 
select * from contact_request; 

delete from contact_request where id_email = 'david@gmail.com';

update contact_request set detail = 'morado' where id_email = 'jose@gmail.com';
select * from contact_request;
