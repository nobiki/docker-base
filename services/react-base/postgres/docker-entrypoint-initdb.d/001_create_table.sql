begin;

create domain created as timestamp default CURRENT_TIMESTAMP;
create domain updated as timestamp default CURRENT_TIMESTAMP;

-- experiences
create table experiences (
  id serial not null
  , description varchar(255)
  , text varchar(255)
  , created created
  , updated updated
) ;

comment on table experiences is 'experiences';
comment on column experiences.id is 'id';
comment on column experiences.description is 'description';
comment on column experiences.text is 'text';
comment on column experiences.created is 'created';
comment on column experiences.updated is 'updated';

create function set_update_time() returns opaque as '
  begin
    new.updated := ''now'';
    return new;
  end;
' language 'plpgsql';

create trigger update_trigger before update on experiences for each row
  execute procedure set_update_time();

-- dummydata
insert into experiences (description, text) values ('xxxxx1', 'xxxxxxxxxxxxxxx1');
insert into experiences (description, text) values ('xxxxx2', 'xxxxxxxxxxxxxxx2');
insert into experiences (description, text) values ('xxxxx3', 'xxxxxxxxxxxxxxx3');

commit;
