begin;
create table hoge
(
    id serial not null,
    name varchar(255)
);
insert into hoge (name) values ('hello1');
insert into hoge (name) values ('hello3');
insert into hoge (name) values ('hello2');
commit;
