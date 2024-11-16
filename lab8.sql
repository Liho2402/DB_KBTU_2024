create database lab8;

create table members (
    member_id int primary key,
    member_name varchar(50),
    city varchar(50),
    membership_level int,
    librarian_id int
);

insert into members (member_id, member_name, city, membership_level, librarian_id) values
(1001, 'John Doe', 'New York', 1, 2001),
(1002, 'Alice Johnson', 'California', 2, 2002),
(1003, 'Bob Smith', 'London', 1, 2003),
(1004, 'Sara Green', 'Paris', 3, 2004),
(1005, 'David Brown', 'New York', 1, 2001),
(1006, 'Emma White', 'Berlin', 2, 2005),
(1007, 'Olivia Black', 'Rome', 3, 2006);

create table borrowings(
    borrowing_id int primary key ,
    borrow_date date,
    return_end date,
    member_id int,
    librarian_id int,
    book_id int
);

insert into borrowings (borrowing_id, borrow_date, return_end, member_id, librarian_id, book_id) values
(30001, '2023-01-05', '2023-01-10', 1002, 2002, 5001),
(30002, '2022-07-10', '2022-07-17', 1003, 2003, 5002),
(30003, '2021-05-12', '2021-05-20', 1001, 2001, 5003),
(30004, '2020-04-08', '2020-04-15', 1006, 2005, 5004),
(30005, '2024-02-20', '2024-02-30', 1007, 2006, 5005),
(30006, '2023-06-02', '2023-06-12', 1005, 2001, 5001);

create table librarians(
    librarian_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(3, 2)
);

insert into librarians (librarian_id, name, city, commission) values
(2001, 'Michael Green', 'New York', 0.15),
(2002, 'Anna Blue', 'California', 0.13),
(2003, 'Chris Red', 'London', 0.12),
(2004, 'Emma Yellow', 'Paris', 0.14),
(2005, 'David Purple', 'Berlin', 0.12),
(2006, 'Laura Orange', 'Rome', 0.13);

-- 3
create view librarians_in_ny as
    select * from librarians
    where city = 'New York';

-- 4

create view borrowing_rwn as
    select b.borrowing_id, b.borrow_date, b.return_end, m.member_name as member_name, l.name as librarian_name
    from borrowings b
    join members m on b.member_id = m.member_id
    join librarians l on b.librarian_id = l.librarian_id;

create role library_user;
grant select on borrowing_rwn to library_user;

-- 5

create view highest_mm as
    select * from members
    where membership_level = (select max(membership_level) from members);

grant select on highest_mm to library_user;

-- 6

create view librarians_count_by_city as
    select city, count(*) as librarian_count
    from librarians
    group by city;

-- 7
create view librarians_wmm as
    select l.librarian_id, l.name, count(distinct m.member_id) as unique_members_count
    from borrowings b
    join librarians l on b.librarian_id = l.librarian_id
    join members m on b.member_id = m.member_id
    group by l.librarian_id, l.name
    having count(distinct  m.member_id) > 1;

create role intern;
grant library_user to intern;




























create view borrowing_records_with_librarian as
    select b.borrowing_id, b.borrow_date, b.return_end, m.member_name as member_name, l.name as librarian_name
    from borrowings b
    join members m on b.member_id = m.member_id
    join librarians l on b.librarian_id = l.librarian_id;

create role library_user;
grant select on borrowing_records_with_librarian to library_user;