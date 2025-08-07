create table wwv_flow_backups$
(
  id                 number, 
  security_group_id  number not null enable, 
  revision           number, 
  backup_type        varchar2(30), -- AUTO or MANUAL
  backup_status      varchar2(30), 
  application_id     number not null enable,
  application_name   varchar2(255 byte),
  description        varchar2(4000 byte), 
  manifest           clob, 
  object_id          number, 
  locked_by          varchar2(255 byte), 
  locked_on          date,
  created_by         varchar2(255 byte), 
  created_on         date, 
  last_updated_by    varchar2(255 byte), 
  last_updated_on    date,
  constraint wwv_flow_backups_pk primary key (id),
  constraint wwv_flow_backups_fk foreign key (security_group_id) 
  references wwv_flow_companies(provisioning_company_id) on delete cascade enable,
  constraint wwv_flow_backups_fk2 foreign key (object_id) 
  references flows_files.wwv_flow_file_objects$(id) on delete cascade enable
);
create index wwv_flow_backups_idx1 on wwv_flow_backups$ (security_group_id);
create index wwv_flow_backups_idx2 on wwv_flow_backups$ (object_id);


create table wwv_flow_backup_log
(
    id	                number, 
    batch_id            number, 
    security_group_id	  number,
    application_id      number, 
    duration            interval day to second, 
    comments            varchar2(4000 byte), 
    created_on	        timestamp(6),
    constraint wwv_flow_backup_log_pk primary key (id)
);

create index wwv_flow_backup_log_idx1 on wwv_flow_backup_log(batch_id);
