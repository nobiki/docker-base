begin;

create domain us_postal_code as varchar(10) default '11111-1111'
check(
    VALUE ~ '^\d{5}$'
OR VALUE ~ '^\d{5}-\d{4}$'
);

create table hoge
(
    id serial primary key,
    name varchar(255) not null default 'hello',
    postal us_postal_code
);

insert into hoge (name) values ('hello1');
insert into hoge (name) values ('hello2');
insert into hoge (postal) values ('12345-1234');
commit;
