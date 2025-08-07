create or replace view wwv_flow_workspace_backups as
select
    b.id,
    b.revision,
    b.backup_type,
    b.backup_status,
    b.application_id,
    b.application_name,
    b.description,
    b.manifest,
    o.id as blob_id,
    o.blob_content,
    b.locked_on,
    b.locked_by,
    b.last_updated_by,
    b.last_updated_on
  from wwv_flow_current_sgid sgid
  join wwv_flow_backups$ b  on (b.security_group_id = sgid.security_group_id)
  join wwv_flow_file_objects$ o on (o.id = b.object_id)
/

comment on column  wwv_flow_workspace_backups.revision                          is 'Incremental value used to indentify application backups';
comment on column  wwv_flow_workspace_backups.backup_type                       is 'Indicates if the backup created as part of daily maintenence or by a developer';
comment on column  wwv_flow_workspace_backups.backup_status                     is 'Used to determine if the backup is in progress, complete or error';
comment on column  wwv_flow_workspace_backups.application_id                    is 'Identifies the application';
comment on column  wwv_flow_workspace_backups.application_name                  is 'The name of the application at the time of backup';
comment on column  wwv_flow_workspace_backups.description                       is 'Optional comments entered for manual backups';
comment on column  wwv_flow_workspace_backups.manifest                          is 'A list of changes since the last backup';
comment on column  wwv_flow_workspace_backups.blob_id                           is 'Identifier of the BLOB content';
comment on column  wwv_flow_workspace_backups.blob_content                      is 'The BLOB that containts the APEX export';
comment on column  wwv_flow_workspace_backups.locked_on                         is 'APEX developer who locked the backup';
comment on column  wwv_flow_workspace_backups.locked_by                         is 'Date and time the backup was locked';
comment on column  wwv_flow_workspace_backups.last_updated_by                   is 'APEX developer who initiated the backup';
comment on column  wwv_flow_workspace_backups.last_updated_on                   is 'Date and time the backup completed';
