--
create database lab1;
--
create table clients(
    client_id serial primary key ,
    first_name varchar(60) not null,
    second_name varchar(60) not null,
    email varchar(100) not null,
    date_joined date
    );

alter table clients add column status int;

alter table clients alter column status type boolean;

alter table clients alter column status set default true;

alter table clients add primary key (client_id);


create table orders(
    order_id serial,
    order_name varchar(100),
    client_id int,
    foreign key (client_id) references clients(client_id)
    );

drop table orders;

drop database lab1


create table lessons(
    id serial primary key,
    name_lesson varchar(100) not null,
    kabinet int not null
);


create table type(
    id serial,
    department varchar(50) not null,
    foreign key (id) references lessons(id)
);


alter table lessons alter column kabinet type varchar(50);