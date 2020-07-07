
-- +migrate Up
create table experiences_new (
  id serial not null
  , description varchar(255)
  , year smallint
  , text varchar(255)
  , created created
  , updated updated
) ;

insert into experiences_new
 (
    id,
    description,
    text,
    created,
    updated
) select
    id,
    description,
    text,
    created,
    updated
  from experiences;

drop table experiences;
alter table experiences_new rename to experiences;

-- +migrate Down
create table experiences_old (
  id serial not null
  , description varchar(255)
  , text varchar(255)
  , created created
  , updated updated
) ;

insert into experiences_old
 (
    id,
    description,
    text,
    created,
    updated
) select
    id,
    description,
    text,
    created,
    updated
  from experiences;

drop table experiences;
alter table experiences_old rename to experiences;
