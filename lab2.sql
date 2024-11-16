create database lab_2;

create table employees(
    employee_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) ,
    department_id int,
    salary int
);

insert into employees(first_name, last_name, department_id, salary) values ('Lee','Stanislav', 666, 1000000);

insert into employees(employee_id, first_name, last_name) values (2, 'Liho', 'Li');

insert into employees(first_name, last_name, department_id, salary) values ('Lisogorov', 'Denis', NULL, 100000);

insert into employees(first_name, last_name, department_id, salary) values
                                                                        ('Kuleshov', 'Ilya', 787, 1000000),
                                                                        ('Blaba', 'LANKLS', 232, 1000000),
                                                                        ('Kudinov', 'Vladislav', 898, 100000),
                                                                        ('Klop','Van', 847, 10000),
                                                                        ('YAsha', 'Kasha', 667, 10000);

alter table employees alter column first_name set default 'John';

insert into employees(last_name, department_id, salary) values ('Cringe', 45, 1231221);

insert into employees default values;

create table employees_archive(like employees including all);

insert into employees_archive
select * from employees;

update employees set department_id=1 where department_id is null;

select first_name, last_name, salary + 1.15 as "Update salary" from employees;

-- update employees set salary = salary * 1.15;

delete from employees where salary < 50000;

delete from employees_archive where employee_id in(select employee_id from employees) returning*;

delete from employees returning*;

