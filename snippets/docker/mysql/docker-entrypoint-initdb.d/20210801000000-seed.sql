create table users (
  id int(16) unsigned auto_increment primary key comment 'id'
  , account varchar(255) not null comment 'account'
  , name varchar(255) default NULL comment 'name'
  , created_at DATETIME default CURRENT_TIMESTAMP not null comment 'created_at'
  , updated_at DATETIME default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP not null comment 'updated_at'
) comment 'users' ;

