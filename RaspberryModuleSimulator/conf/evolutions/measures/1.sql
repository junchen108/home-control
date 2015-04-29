# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table measure (
  id                        bigint not null,
  value                     double,
  date                      timestamp,
  constraint pk_measure primary key (id))
;

create sequence measure_seq;




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists measure;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists measure_seq;

