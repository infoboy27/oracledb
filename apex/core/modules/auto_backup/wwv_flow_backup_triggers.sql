create or replace trigger wwv_flow_backups_t1
before insert or update 
on wwv_flow_backups$
for each row
begin
    if not wwv_flow.g_import_in_progress then
        if :new.id is null then
          :new.id := wwv_flow_id.next_val();
        end if;

        if inserting then
          :new.created_on := sysdate;
          :new.created_by := nvl(wwv_flow.g_user,user);
        end if;

        if inserting or updating then
          :new.last_updated_on := sysdate;
          :new.last_updated_by := nvl(wwv_flow.g_user,user);
        end if;
    end if;
end;
/

alter trigger wwv_flow_backups_t1 enable;

create or replace trigger wwv_flow_backup_log_t1 before insert on wwv_flow_backup_log
    for each row
begin
    if not wwv_flow.g_import_in_progress then
        if :new.id is null then
            :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        end if;
        :new.created_on := systimestamp;
    end if;
end;
/

alter trigger wwv_flow_backup_log_t1 enable;

