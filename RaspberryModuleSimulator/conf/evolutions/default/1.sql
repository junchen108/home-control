# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table environment (
  id                        varchar(255) not null,
  temperature               varchar(255),
  date                      varchar(255),
  constraint pk_environment primary key (id))
;

create sequence environment_seq;




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists environment;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists environment_seq;

